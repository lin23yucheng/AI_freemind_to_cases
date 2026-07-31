import sys
import xml.etree.ElementTree as ET
import csv
import copy
import os
import requests
import json
import time
import re
import logging
from functools import lru_cache
from dotenv import load_dotenv

load_dotenv()  # 加载环境变量

# ===== LLM 配置 =====
INCLUDE_PARENT = False  # 仅提取叶子节点
FREEMIND_FILE = "AI测试用例.mm"
DEFAULT_PROVIDER = "deepseek"
SUPPORTED_PROVIDERS = {"deepseek", "zhipu", "github", "openai_compatible"}

# 保留旧模式开关：完整用例模式默认关闭标题优化，避免额外调用。
use_llm_optimize_title = os.getenv("USE_LLM_OPTIMIZE_TITLE", "false").lower() == "true"
# 默认生成完整用例；设为 False 时才回退到层级路径/标题优化模式。
enable_llm_generate_full_case = os.getenv("ENABLE_LLM_GENERATE_FULL_CASE", "true").lower() == "true"

# OpenAI 兼容接口配置入口。可在 .env 中覆盖，兼容 DeepSeek、豆包等服务。
api_key = os.getenv("LLM_API_KEY", "")
base_url = os.getenv("LLM_API_URL", "")
model_name = os.getenv("LLM_MODEL", "")
LLM_TIMEOUT_SECONDS = int(os.getenv("LLM_TIMEOUT_SECONDS", "30"))
LLM_MAX_RETRIES = int(os.getenv("LLM_MAX_RETRIES", "3"))
# 仅用于日志预警，不会截断任何思维导图测试点上下文。
LLM_CONTEXT_WARNING_CHARS = int(os.getenv("LLM_CONTEXT_WARNING_CHARS", "150000"))

logging.basicConfig(level=logging.INFO, format="%(asctime)s %(levelname)s %(message)s")
logger = logging.getLogger(__name__)

FULL_CASE_SYSTEM_PROMPT = """你是专业测试工程师，严格遵守约束：
1. 仅允许基于提供的【测试点原文】生成测试用例，绝对不能新增测试点不存在的业务规则、校验逻辑、功能限制；禁止脑补任何未写明的隐性需求。
   测试点原文包含【整份思维导图测试点】和【当前焦点测试点】。整份思维导图只用于理解项目术语、上下文和已明确的关联约束；当前焦点测试点决定本次用例要验证什么。
   当前焦点测试点中明确的每项约束必须在输出用例的标题、前置条件、操作步骤或预期结果中得到体现；若拆分多条用例，则这些用例合起来必须覆盖全部焦点约束。
2. 输出固定结构，仅返回JSON，不要额外解释、前言、markdown格式。
JSON字段规范：
{
  \"case_title\": \"精炼标准用例标题\",
  \"precondition\": \"预置/前置条件\",
  \"operation_steps\": \"分步清晰的操作步骤\",
  \"expected_result\": \"明确可校验的预期结果\",
  \"priority\": \"1-4 之一\"
}
3. operation_steps 与 expected_result 必须均使用从 1 开始的数字序号。两者条目数量必须严格相等，且第 N 条预期结果只能对应第 N 条操作步骤；不得合并步骤预期、不得遗漏任一步骤的预期结果。
4. 区分正向、边界、异常场景；测试数据贴合测试点约束；
5. 如果单个测试点可以拆分多条独立场景，可以输出多条JSON数组；
6. 语言简洁，适配导入测试管理平台。
7. 每条用例必须给出 priority，且只能是字符串 \"1\"、\"2\"、\"3\" 或 \"4\"。结合当前焦点测试点、所在模块和已明确的全图上下文判断：
   - 1：核心主链路阻断、明显安全风险、数据丢失/错误或系统不可用风险；
   - 2：重要或高频功能、主要异常处理与关键业务规则；
   - 3：一般功能验证、常规边界与低频异常场景；
   - 4：仅影响展示、文案、样式或其他低影响体验的场景。
   测试点没有足够信息时使用 \"2\"，不得根据未提供的业务信息臆测风险。
【待处理测试点原文】：{{full_test_point_text}}"""

cases_format = {
    "所属模块": "",
    "用例标题": "",
    "前置条件": "",
    "步骤": "1.\n2.\n3.\n",
    "预期": "",
    "关键词": "1",
    "优先级": "3",
    "用例类型": "功能测试",
    "适用阶段": "功能测试阶段"
}

# LLM 的英文键仅用于内部解析；导出保持原有测试管理平台中文字段。
FULL_CASE_FIELDS = ["case_title", "precondition", "operation_steps", "expected_result"]
VALID_PRIORITIES = {"1", "2", "3", "4"}
DEFAULT_PRIORITY = "2"
# 导出列仅保留原始字段，避免与 LLM 内部字段形成重复列。
EXPORT_FIELDS = list(cases_format.keys())

# 定义字段映射关系
FIELD_MAPPING = {
    "前置条件": ["前置条件", "precondition", "前提条件"],
    "步骤": ["步骤", "steps", "procedure", "操作步骤"],
    "预期": ["预期", "expected", "expected_result", "预期结果"]
}


@lru_cache(maxsize=1)
def get_llm_config():
    """根据环境变量加载模型提供商配置。"""
    provider = os.getenv("LLM_PROVIDER", DEFAULT_PROVIDER).strip().lower()

    if provider not in SUPPORTED_PROVIDERS:
        raise ValueError(
            f"不支持的 LLM_PROVIDER: {provider}。支持的值：{', '.join(sorted(SUPPORTED_PROVIDERS))}"
        )

    if provider == "zhipu":
        configured_api_key = os.getenv("ZHIPU_API_KEY") or api_key
        api_url = os.getenv("ZHIPU_API_URL") or base_url or \
            "https://open.bigmodel.cn/api/paas/v4/chat/completions"
        model = os.getenv("ZHIPU_MODEL") or model_name or "glm-4-flash"
    elif provider == "deepseek":
        configured_api_key = os.getenv("DEEPSEEK_API_KEY") or api_key
        api_url = os.getenv("DEEPSEEK_API_URL") or base_url or \
            "https://api.deepseek.com/chat/completions"
        model = os.getenv("DEEPSEEK_MODEL") or model_name or "deepseek-v4-flash"
    else:
        configured_api_key = os.getenv("GITHUB_TOKEN") or api_key
        api_url = os.getenv("GITHUB_MODELS_API_URL") or base_url
        model = os.getenv("GITHUB_MODEL") or model_name or "gpt-4o-mini"

    if not configured_api_key:
        raise ValueError("未配置 API Key，请在 .env 中设置对应提供商的密钥")

    if not api_url:
        raise ValueError("未配置 API URL，请在 .env 中设置对应提供商的接口地址")

    return {
        "provider": provider,
        "api_key": configured_api_key,
        "api_url": api_url,
        "model": model
    }


def _strip_json_markdown(text):
    """移除模型可能返回的 ```json 代码块包裹。"""
    if not isinstance(text, str):
        return text

    content = text.strip()
    match = re.match(r"^```(?:json)?\s*(.*?)\s*```$", content, flags=re.S | re.I)
    return match.group(1).strip() if match else content


def _extract_response_content(result):
    """兼容提取 chat/completions 响应中的文本内容。"""
    if not result.get("choices"):
        return ""

    message = result["choices"][0].get("message", {})
    content = message.get("content", "")

    if isinstance(content, list):
        text_parts = []
        for item in content:
            if isinstance(item, dict):
                if item.get("type") == "text" and item.get("text"):
                    text_parts.append(item["text"])
                elif isinstance(item.get("content"), str):
                    text_parts.append(item["content"])
        content = "\n".join(text_parts)

    if isinstance(content, dict):
        content = json.dumps(content, ensure_ascii=False)

    return _strip_json_markdown(content)


def _build_payload(title, provider, model, system_prompt):
    """按不同提供商构造请求体。"""
    payload = {
        "model": model,
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": f"用例标题：{title}"}
        ],
        "temperature": 0.1,
        "max_tokens": 500
    }

    if provider in {"zhipu", "deepseek"}:
        payload.update({
            "response_format": {"type": "json_object"}
        })
    if provider == "zhipu":
        payload.update({
            "do_sample": False,
            "top_p": 0.7
        })

    return payload


def map_fields(data):
    """将模型返回的字段映射到CSV表头"""
    mapped_data = {}
    for target_field, possible_fields in FIELD_MAPPING.items():
        for source_field in possible_fields:
            if source_field in data:
                mapped_data[target_field] = data[source_field]
                break
    return mapped_data


def ensure_step_expectation_match(steps, expectations):
    """确保步骤和预期结果的序号匹配，并清理重复序号"""

    def clean_duplicate_first_numbering(text):
        return re.sub(r'^(\d+\.\s+)\1+', r'\1', text, count=1, flags=re.M)

    steps = clean_duplicate_first_numbering(steps)
    expectations = clean_duplicate_first_numbering(expectations)

    # 解析步骤和预期
    step_list = []
    step_lines = steps.strip().split('\n')
    current_step = ""
    current_num = None

    for line in step_lines:
        match = re.match(r'^(\d+)\.\s+(.*)$', line)
        if match:
            if current_step:
                step_list.append(current_step)
            current_num = match.group(1)
            current_step = match.group(2)
        else:
            if current_step:
                current_step += '\n' + line
            else:
                current_step = line

    if current_step:
        step_list.append(current_step)

    # 对预期结果执行相同的解析逻辑
    exp_list = []
    exp_lines = expectations.strip().split('\n')
    current_exp = ""
    current_exp_num = None

    for line in exp_lines:
        match = re.match(r'^(\d+)\.\s+(.*)$', line)
        if match:
            if current_exp:
                exp_list.append(current_exp)
            current_exp_num = match.group(1)
            current_exp = match.group(2)
        else:
            if current_exp:
                current_exp += '\n' + line
            else:
                current_exp = line

    if current_exp:
        exp_list.append(current_exp)

    # 如果数量不匹配，尝试补齐
    max_len = max(len(step_list), len(exp_list))

    # 确保两个列表长度相同
    while len(step_list) < max_len:
        step_list.append("")
    while len(exp_list) < max_len:
        exp_list.append("")

    # 重新格式化，确保都有序号
    formatted_steps = "\n".join([f"{i + 1}. {step}" for i, step in enumerate(step_list)])
    formatted_expectations = "\n".join([f"{i + 1}. {exp}" for i, exp in enumerate(exp_list)])

    return formatted_steps, formatted_expectations


def _escape_control_characters_in_json_strings(text):
    """转义 JSON 字符串内模型错误输出的原始控制字符。"""
    escaped = []
    in_string = False
    is_escaped = False

    for char in text:
        if in_string and char == "\n":
            escaped.append("\\n")
        elif in_string and char == "\r":
            escaped.append("\\r")
        elif in_string and char == "\t":
            escaped.append("\\t")
        else:
            escaped.append(char)

        if char == '"' and not is_escaped:
            in_string = not in_string
        is_escaped = char == "\\" and not is_escaped
        if char != "\\":
            is_escaped = False

    return "".join(escaped)


def robust_json_parse(json_str):
    """解析模型返回的 JSON，并兼容字符串中的原始换行符。"""
    json_str = _strip_json_markdown(json_str)

    try:
        # 尝试直接解析
        return json.loads(json_str)
    except json.JSONDecodeError as e:
        # print(f"⚠️ JSON解析失败: {e}")

        # 某些模型会在 JSON 字符串中输出原始换行符，修复后再解析。
        try:
            fixed_str = _escape_control_characters_in_json_strings(json_str)
            return json.loads(fixed_str)
        except json.JSONDecodeError as e2:
            logger.debug("JSON 修复后仍无法解析: %s", e2)

            # 按已知字段边界恢复缺少闭合引号的响应。
            try:
                fields = ("前置条件", "步骤", "预期")
                recovered = {}
                for index, field in enumerate(fields):
                    next_fields = fields[index + 1:]
                    boundaries = [rf'\s*,?\s*"{name}"\s*:' for name in next_fields]
                    boundaries.append(r'\s*}\s*$')
                    match = re.search(
                        rf'"{field}"\s*:\s*"(.*?)(?={"|".join(boundaries)})',
                        json_str,
                        flags=re.S,
                    )
                    if match:
                        recovered[field] = match.group(1).rstrip('"').strip()

                return recovered
            except Exception as e3:
                logger.debug("无法提取任何 JSON 信息: %s", e3)
                return {}


def _extract_json_value(text):
    """从模型的额外说明中提取最先出现的 JSON 对象或数组。"""
    cleaned = _strip_json_markdown(text)
    direct_value = robust_json_parse(cleaned)
    if direct_value:
        return direct_value

    decoder = json.JSONDecoder()
    for index, char in enumerate(cleaned):
        if char not in "[{":
            continue
        try:
            value, _ = decoder.raw_decode(cleaned[index:])
            return value
        except json.JSONDecodeError:
            continue
    return {}


def normalise_priority(value):
    """仅保留测试管理平台支持的 1 至 4 级优先级。"""
    priority = str(value).strip()
    if priority in VALID_PRIORITIES:
        return priority
    logger.warning("LLM 返回了无效优先级 %r，已使用默认优先级 %s", value, DEFAULT_PRIORITY)
    return DEFAULT_PRIORITY


def _normalise_full_case_response(content, with_diagnostics=False):
    """校验完整用例响应结构；诊断信息只描述格式，不包含用例正文。"""
    parsed = _extract_json_value(content)
    if not parsed:
        result = ([], "模型响应无法解析为 JSON 对象或 JSON 数组")
        return result if with_diagnostics else result[0]

    items = parsed if isinstance(parsed, list) else [parsed]
    valid_cases = []
    errors = []
    for index, item in enumerate(items, start=1):
        if not isinstance(item, dict):
            errors.append(f"第 {index} 项不是 JSON 对象")
            continue
        case = {field: str(item.get(field, "")).strip() for field in FULL_CASE_FIELDS}
        missing_fields = [field for field, value in case.items() if not value]
        if missing_fields:
            errors.append(f"第 {index} 项缺少字段：{', '.join(missing_fields)}")
            continue
        alignment_error = _get_step_expectation_alignment_error(
            case["operation_steps"], case["expected_result"]
        )
        if not alignment_error:
            case["priority"] = normalise_priority(item.get("priority", DEFAULT_PRIORITY))
            valid_cases.append(case)
        else:
            errors.append(f"第 {index} 项{alignment_error}")

    if valid_cases:
        result = (valid_cases, "")
    else:
        result = ([], "；".join(errors) or "模型响应不包含有效用例")
    return result if with_diagnostics else result[0]


def _steps_and_expectations_are_aligned(operation_steps, expected_result):
    """只接受编号连续、数量相同的步骤和预期，防止生成不成对的用例。"""
    return not _get_step_expectation_alignment_error(operation_steps, expected_result)


def _get_step_expectation_alignment_error(operation_steps, expected_result):
    """返回不成对原因，仅含编号与数量，不记录具体用例内容。"""
    number_pattern = r"(?m)^\s*(\d+)[.、)]\s+\S"
    step_numbers = [int(number) for number in re.findall(number_pattern, operation_steps)]
    expected_numbers = [int(number) for number in re.findall(number_pattern, expected_result)]
    expected_sequence = list(range(1, len(step_numbers) + 1))
    if not step_numbers:
        return "操作步骤未使用连续数字编号"
    if step_numbers != expected_sequence:
        return f"操作步骤编号不连续（检测到 {step_numbers}）"
    if len(expected_numbers) != len(step_numbers):
        return f"步骤 {len(step_numbers)} 条、预期 {len(expected_numbers)} 条，数量不一致"
    if expected_numbers != expected_sequence:
        return f"预期结果编号不连续（检测到 {expected_numbers}）"
    return ""


def build_project_test_point_context(case_titles):
    """将既有叶子路径汇总为完整项目测试点上下文，不改变节点遍历逻辑。"""
    return "\n".join(
        f"[{index}] {test_point}" for index, test_point in enumerate(case_titles, start=1)
    )


def build_complete_case_input(project_test_point_context, focused_test_point):
    """明确区分全图上下文和本次必须覆盖的焦点测试点。"""
    return (
        "【整份思维导图测试点】\n"
        f"{project_test_point_context}\n\n"
        "【当前焦点测试点】\n"
        f"{focused_test_point}"
    )


def llm_generate_complete_case(full_test_point_str):
    """按全图上下文及当前焦点测试点生成结构化用例；失败时返回空列表。"""
    focus_match = re.search(r"【当前焦点测试点】\s*(.*)$", full_test_point_str, flags=re.S)
    focused_test_point = focus_match.group(1).strip() if focus_match else full_test_point_str
    if len(full_test_point_str) > LLM_CONTEXT_WARNING_CHARS:
        logger.warning("全图测试点上下文超过预警值 %s 字符，需使用支持足够上下文窗口的模型；内容未截断。",
                       LLM_CONTEXT_WARNING_CHARS)
    try:
        config = get_llm_config()
    except (ValueError, OSError) as exc:
        logger.error("LLM配置不可用，保留原始测试点：%s", exc)
        return []

    headers = {"Content-Type": "application/json", "Authorization": f"Bearer {config['api_key']}"}
    payload = {
        "model": config["model"],
        "messages": [{"role": "system", "content": FULL_CASE_SYSTEM_PROMPT.replace(
            "{{full_test_point_text}}", full_test_point_str)}],
        "temperature": 0,
        "max_tokens": 1500,
    }

    last_failure_reason = "未知错误"
    for attempt in range(1, LLM_MAX_RETRIES + 1):
        try:
            response = requests.post(config["api_url"], headers=headers, json=payload,
                                     timeout=LLM_TIMEOUT_SECONDS)
            response.raise_for_status()
            content = _extract_response_content(response.json())
            cases, invalid_reason = _normalise_full_case_response(content, with_diagnostics=True)
            if cases:
                logger.info("LLM返回解析成功：生成 %s 条用例，响应长度 %s 字符",
                            len(cases), len(content))
                return cases
            # 中间重试静默处理，仅在最终失败时输出最后一次具体原因。
            last_failure_reason = invalid_reason
        except (requests.RequestException, ValueError, KeyError, json.JSONDecodeError) as exc:
            last_failure_reason = f"LLM 请求或响应异常：{exc}"

        if attempt < LLM_MAX_RETRIES:
            time.sleep(2)

    logger.error("LLM生成失败，保留当前焦点测试点：%s；失败原因：%s",
                 focused_test_point, last_failure_reason)
    return []


def llm_optimize_case_title(full_test_point_str, fallback_title):
    """旧模式仅优化标题，不生成或补全任何测试步骤与业务规则。"""
    try:
        config = get_llm_config()
    except (ValueError, OSError) as exc:
        logger.warning("标题优化不可用，使用层级标题：%s", exc)
        return fallback_title

    prompt = (
        "仅基于【测试点原文】改写一个精炼的测试用例标题，不得增加任何业务含义。"
        "仅返回 JSON：{\"case_title\": \"...\"}。\n"
        f"【测试点原文】：{full_test_point_str}"
    )
    headers = {"Content-Type": "application/json", "Authorization": f"Bearer {config['api_key']}"}
    payload = {
        "model": config["model"],
        "messages": [{"role": "system", "content": prompt}],
        "temperature": 0,
        "max_tokens": 200,
    }
    try:
        response = requests.post(config["api_url"], headers=headers, json=payload,
                                 timeout=LLM_TIMEOUT_SECONDS)
        response.raise_for_status()
        result = _extract_json_value(_extract_response_content(response.json()))
        title = result.get("case_title", "").strip() if isinstance(result, dict) else ""
        logger.info("标题优化返回解析%s", "成功" if title else "为空，使用层级标题")
        return title or fallback_title
    except (requests.RequestException, ValueError, KeyError, json.JSONDecodeError) as exc:
        logger.warning("标题优化失败，使用层级标题：%s", exc)
        return fallback_title


# ===== LLM API 调用函数 =====
def generate_test_case_details(title):
    """根据标题生成测试用例详情。"""
    config = get_llm_config()

    system_prompt = """
    你是专业的软件测试工程师，请根据用例标题严格按照以下JSON格式生成测试用例：
    {
        "前置条件": "系统已启动，用户已登录",
        "步骤": "1. 打开功能页面\\n2. 输入测试数据\\n3. 点击提交按钮",
        "预期": "1. 成功打开页面\\n2. 数据正确输入\\n3. 系统成功处理并提示操作成功"
    }

    请确保：
    1. 每个字段内容保持简洁，步骤和预期结果各最多3项
    2. 步骤和预期结果都使用数字序号（1., 2., 3.等）开头
    3. 步骤和预期结果的数量必须一致，一一对应
    4. 字段名与上述示例完全一致，不要添加其他字段
    5. 必须返回一个可由 json.loads 直接解析的合法 JSON 对象，不要使用 Markdown 代码块
    6. 步骤和预期中的换行必须在 JSON 字符串中写为 \\n，不能输出原始换行
    """

    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {config['api_key']}"
    }

    payload = _build_payload(title, config["provider"], config["model"], system_prompt)

    for attempt in range(3):  # 重试3次
        try:
            response = requests.post(config["api_url"], headers=headers, json=payload, timeout=30)
            response.raise_for_status()
            result = response.json()

            # 解析响应
            if not result.get("choices"):
                print("⚠️ 模型未返回有效结果，准备重试")
                continue

            content = _extract_response_content(result)
            if not content:
                finish_reason = result["choices"][0].get("finish_reason", "unknown")
                print(f"⚠️ 响应内容为空（结束原因: {finish_reason}），准备重试")
                continue

            # 调试输出原始响应
            # print(f"\n=== 原始响应 ({title}) ===")
            # print(content[:200] + "...")  # 只打印前200个字符

            # 使用健壮的解析函数
            details = robust_json_parse(content)
            if not details:
                finish_reason = result["choices"][0].get("finish_reason", "unknown")
                print(f"⚠️ JSON无法解析（结束原因: {finish_reason}），准备重试")
                continue

            # 调试输出解析后的字段
            # print(f"\n=== 解析后的字段 ({title}) ===")
            # print(list(details.keys()))

            # 确保步骤和预期匹配
            if "步骤" in details and "预期" in details:
                steps, expectations = ensure_step_expectation_match(details["步骤"], details["预期"])
                details["步骤"] = steps
                details["预期"] = expectations

            return details  # 直接返回解析后的详情，不进行映射

        except Exception as e:
            print(f"❌ API调用失败 (尝试 {attempt + 1}/3): {str(e)}")
            time.sleep(2)  # 等待2秒后重试

    # 所有重试都失败
    print("❌ 所有重试都失败，使用默认值")
    return _get_default_details()


def _get_default_details():
    """默认值处理"""
    return {
        "前置条件": "系统正常运行",
        "步骤": "1. 进入功能页面\n2. 执行核心操作\n3. 验证结果正确性",
        "预期": "1. 成功进入页面\n2. 操作成功执行\n3. 结果符合业务逻辑"
    }


# ===== 标题解析函数（修改：保留括号内容，调整标题格式） =====
def parse_case_title(data):
    """解析带层级的标题，保留括号内容（含全角/半角分隔符处理）"""
    try:
        # print(f"\n==== 开始解析标题 ====")
        # print(f"原始标题: {data}")

        # 1. 处理全角/半角分隔符（- 和 －），并保留前后空格
        separator_pattern = r'\s*[-－]\s*'  # 匹配半角'-'和全角'－'，及前后空格
        parts = [part.strip() for part in re.split(separator_pattern, data) if part.strip()]

        # print(f"分割后的层级列表: {parts}")  # 新增调试日志，查看分割是否正确

        # 2. 检查层级数量
        if len(parts) < 2:
            print(f"⚠️ 层级不足（需至少2层），原始标题: {data}")
            return None, None

        # 3. 构建标题和模块（直接使用原始分割结果，不做二次处理）
        formatted_title = " - ".join(parts[1:])  # 从第2层开始到最后一层
        module = " - ".join(parts[1:-1]) if len(parts) > 2 else ""  # 中间层作为模块
        module_path = f"/{module}/" if module else "/"

        # print(f"解析结果:")
        # print(f"  格式化标题: {formatted_title}")
        # print(f"  所属模块: {module}")
        # print(f"==== 解析完成 ====\n")

        return formatted_title, module_path

    except Exception as e:
        print(f"❌ 解析失败: {str(e)}")
        return None, None


def _ensure_export_header(csv_file):
    """为旧 CSV 补充新列，避免断点续跑时表头与数据字段不一致。"""
    if not os.path.exists(csv_file):
        os.makedirs(os.path.dirname(csv_file), exist_ok=True)
        with open(csv_file, "w", newline="", encoding="utf-8-sig") as f:
            csv.DictWriter(f, fieldnames=EXPORT_FIELDS).writeheader()
        return

    with open(csv_file, "r", newline="", encoding="utf-8-sig") as f:
        reader = csv.DictReader(f)
        current_fields = reader.fieldnames or []
        rows = list(reader)

    if current_fields == EXPORT_FIELDS:
        return

    # 完整模式曾输出英文内部字段；迁移时仅保留原有测试管理平台字段。
    with open(csv_file, "w", newline="", encoding="utf-8-sig") as f:
        writer = csv.DictWriter(f, fieldnames=EXPORT_FIELDS, extrasaction="ignore")
        writer.writeheader()
        writer.writerows(rows)


# ===== 主处理函数（修复断点文件处理逻辑） =====
def freemind_to_cases(freemind_file, csv_file):
    try:
        tree = ET.parse(freemind_file)
    except IOError:
        print(f"❌ 文件不存在: {freemind_file}")
        return

    root = tree.getroot()
    case_titles = []

    # 仅在最后一个层次（叶子节点）创建用例标题
    def parse_node(node, parent_text=None):
        topic = node.attrib.get("TEXT")
        if topic:
            full_topic = f"{parent_text} - {topic}" if parent_text else topic
            # 仅当该节点没有子节点（即叶子节点）时，才添加到用例标题列表
            if len(node) == 0:  # 检查节点是否有子节点，无则为叶子节点
                case_titles.append(full_topic.strip())
            for child in node:
                parse_node(child, full_topic)
        else:
            for child in node:
                parse_node(child, parent_text)

    parse_node(root)

    # 过滤父节点
    case_titles = [t for t in case_titles if t.count("-") >= 1]

    # 复用原有叶子路径结果生成全图上下文；不修改 XML 读取和树遍历核心逻辑。
    project_test_point_context = build_project_test_point_context(case_titles)
    if enable_llm_generate_full_case:
        logger.info("已构造完整思维导图测试点上下文：%s 条叶子测试点，%s 字符",
                    len(case_titles), len(project_test_point_context))

    # 检查断点文件
    breakpoint_file = csv_file + ".breakpoint"
    processed_titles = set()

    if os.path.exists(breakpoint_file):
        with open(breakpoint_file, "r", encoding="utf-8") as f:
            processed_titles = set(f.read().splitlines())
        print(f"✅ 加载断点文件，已处理{len(processed_titles)}条用例")
    else:
        print("✅ 未找到断点文件，将处理所有用例")

    # 创建文件或为旧文件补齐完整用例字段。
    _ensure_export_header(csv_file)

    total = len(case_titles)
    remaining = total - len(processed_titles)
    print(f"共{total}条测试用例，剩余{remaining}条需要处理")

    for i, data in enumerate(case_titles):
        # 只有在断点文件存在且包含当前标题时才跳过
        if os.path.exists(breakpoint_file) and data in processed_titles:
            print(f"⏩ 跳过已处理的用例: {data}")
            continue

        try:
            print(f"正在处理 ({i + 1}/{total}): {data}")

            title, module = parse_case_title(data)
            if not title:
                print(f"⚠️ 标题解析失败，跳过: {data}")
                continue

            # 兼容旧的标题优化模式；完整用例模式的 case_title 由完整生成结果提供。
            if use_llm_optimize_title and not enable_llm_generate_full_case:
                title = llm_optimize_case_title(data, title)

            # 完整模式：全图负责项目理解，当前叶子路径定义本条必须覆盖的测试点。
            complete_case_input = build_complete_case_input(project_test_point_context, data)
            generated_cases = (
                llm_generate_complete_case(complete_case_input)
                if enable_llm_generate_full_case else []
            )
            if enable_llm_generate_full_case and not generated_cases:
                generated_cases = [{
                    "case_title": f"[LLM生成失败] {title}",
                    "precondition": f"[原始测试点] {data}",
                    "operation_steps": "[LLM生成失败，未生成操作步骤]",
                    "expected_result": "[LLM生成失败，未生成预期结果]",
                    "priority": DEFAULT_PRIORITY,
                }]
            if not enable_llm_generate_full_case:
                generated_cases = [{
                    "case_title": title,
                    "precondition": "",
                    "operation_steps": "",
                    "expected_result": "",
                    "priority": DEFAULT_PRIORITY,
                }]

            # 数组响应按独立场景拆分为多行，旧字段同步写入以保持导入兼容。
            with open(csv_file, "a", newline="", encoding="utf-8-sig") as f:
                writer = csv.DictWriter(f, fieldnames=EXPORT_FIELDS, extrasaction="ignore")
                for generated_case in generated_cases:
                    temp = copy.deepcopy(cases_format)
                    temp["用例标题"] = generated_case["case_title"]
                    temp["所属模块"] = module
                    temp["优先级"] = normalise_priority(generated_case.get("priority"))
                    temp["前置条件"] = generated_case["precondition"]
                    temp["步骤"] = generated_case["operation_steps"]
                    temp["预期"] = generated_case["expected_result"]
                    temp.update(generated_case)
                    writer.writerow(temp)

            # 记录断点
            with open(breakpoint_file, "a", encoding="utf-8") as f:
                f.write(f"{data}\n")

            if enable_llm_generate_full_case:
                time.sleep(1.5)  # 避免速率限制

        except KeyboardInterrupt:
            print(f"\n⚠️ 程序被手动中断，已生成{i + 1}条测试用例到 {csv_file}")
            return
        except Exception as e:
            print(f"❌ 处理失败: {str(e)}")

    # 处理完成后删除断点文件
    if os.path.exists(breakpoint_file):
        os.remove(breakpoint_file)

    print(f"\n✅ 全部完成，共生成{total}条测试用例")


# ===== 程序入口 =====
if __name__ == "__main__":
    input_path = f"./FreeMindFiles/{FREEMIND_FILE}"
    # 与旧标题模式结果分文件导出，避免已有断点跳过曾按旧模式处理的节点。
    output_suffix = "_full_cases" if enable_llm_generate_full_case else ""
    output_path = f"./ExcelFiles/{FREEMIND_FILE.split('.')[0]}{output_suffix}.csv"

    print(f"开始处理文件: {input_path}")
    print(f"标题优化开关: {use_llm_optimize_title}")
    print(f"完整用例生成开关: {enable_llm_generate_full_case}")
    if enable_llm_generate_full_case:
        try:
            llm_config = get_llm_config()
            print(f"当前模型提供商: {llm_config['provider']} | 模型: {llm_config['model']}")
        except ValueError as e:
            print(f"⚠️ {e}；将继续导出原始测试点失败标记")
    freemind_to_cases(input_path, output_path)
