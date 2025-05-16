import sys
import xml.etree.ElementTree as ET
import csv
import copy
import random
import os
import requests
import json
import time
import re
from dotenv import load_dotenv

load_dotenv()  # 加载环境变量

# ===== GLM-4配置 =====
INCLUDE_PARENT = False  # 仅提取叶子节点
FREEMIND_FILE = "算力管理平台V1-3测试点.mm"
ZHIPU_API_KEY = os.getenv("ZHIPU_API_KEY")  # 需在.env中配置
API_URL = "https://open.bigmodel.cn/api/paas/v4/chat/completions"  # GLM-4同步接口
MODEL = "glm-4-plus"  # 替换为你要使用的模型编码

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

# 定义字段映射关系
FIELD_MAPPING = {
    "前置条件": ["前置条件", "precondition", "前提条件"],
    "步骤": ["步骤", "steps", "procedure", "操作步骤"],
    "预期": ["预期", "expected", "expected_result", "预期结果"]
}


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


def robust_json_parse(json_str):
    """健壮地解析JSON字符串，处理包含换行符的情况"""
    try:
        # 尝试直接解析
        return json.loads(json_str)
    except json.JSONDecodeError as e:
        # print(f"⚠️ JSON解析失败: {e}")

        # 尝试修复换行符问题
        try:
            # 查找并修复字符串值中的换行符
            # 匹配: "key": "value\nwith newline" 并将其替换为 "key": "value\\nwith newline"
            fixed_str = re.sub(r'"([^"\\]*(?:\\.[^"\\]*)*)"',
                               lambda m: m.group(0).replace('\n', '\\n'),
                               json_str)

            return json.loads(fixed_str)
        except json.JSONDecodeError as e2:
            print(f"⚠️ 修复后仍无法解析: {e2}")

            # 提取关键信息作为备用
            try:
                # 使用正则表达式提取前置条件、步骤和预期
                precondition_match = re.search(r'"前置条件"\s*:\s*"([^"]+)"', json_str)
                steps_match = re.search(r'"步骤"\s*:\s*"([^"]+)"', json_str)
                expected_match = re.search(r'"预期"\s*:\s*"([^"]+)"', json_str)

                return {
                    "前置条件": precondition_match.group(1) if precondition_match else "",
                    "步骤": steps_match.group(1) if steps_match else "",
                    "预期": expected_match.group(1) if expected_match else ""
                }
            except Exception as e3:
                print(f"❌ 无法提取任何信息: {e3}")
                return {}


# ===== GLM-4 API调用函数 =====
def generate_test_case_details(title):
    """根据标题生成测试用例详情（GLM-4版本）"""
    system_prompt = """
    你是专业的软件测试工程师，请根据用例标题严格按照以下JSON格式生成测试用例：
    {
        "前置条件": "系统已启动，用户已登录",
        "步骤": "1. 打开功能页面\n2. 输入测试数据\n3. 点击提交按钮",
        "预期": "1. 成功打开页面\n2. 数据正确输入\n3. 系统成功处理并提示操作成功"
    }

    请确保：
    1. 步骤和预期结果都使用数字序号（1., 2., 3.等）开头
    2. 步骤和预期结果的数量必须一致，一一对应
    3. 字段名与上述示例完全一致，不要添加其他字段
    4. 字符串值中的换行符不需要转义（直接使用\n）
    """

    headers = {
        "Content-Type": "application/json",
        "Authorization": f"Bearer {ZHIPU_API_KEY}"
    }

    payload = {
        "model": MODEL,
        "messages": [
            {"role": "system", "content": system_prompt},
            {"role": "user", "content": f"用例标题：{title}"}
        ],
        "do_sample": False,
        "temperature": 0.2,
        "top_p": 0.7,
        "max_tokens": 300,
        "response_format": {"type": "json_object"}
    }

    for attempt in range(3):  # 重试3次
        try:
            response = requests.post(API_URL, headers=headers, json=payload, timeout=30)
            response.raise_for_status()
            result = response.json()

            # 解析响应
            if not result.get("choices"):
                print("❌ 模型未返回有效结果")
                return _get_default_details()

            content = result["choices"][0]["message"].get("content")
            if not content:
                print("❌ 响应内容为空")
                return _get_default_details()

            # 调试输出原始响应
            # print(f"\n=== 原始响应 ({title}) ===")
            # print(content[:200] + "...")  # 只打印前200个字符

            # 使用健壮的解析函数
            details = robust_json_parse(content)

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

    # 检查断点文件
    breakpoint_file = csv_file + ".breakpoint"
    processed_titles = set()

    if os.path.exists(breakpoint_file):
        with open(breakpoint_file, "r", encoding="utf-8") as f:
            processed_titles = set(f.read().splitlines())
        print(f"✅ 加载断点文件，已处理{len(processed_titles)}条用例")
    else:
        print("✅ 未找到断点文件，将处理所有用例")

    # 创建文件并写入表头（如果文件不存在）
    if not os.path.exists(csv_file):
        os.makedirs(os.path.dirname(csv_file), exist_ok=True)
        with open(csv_file, "w", newline="", encoding="utf-8-sig") as f:  # 使用utf-8-sig编码
            writer = csv.DictWriter(f, fieldnames=cases_format.keys())
            writer.writeheader()

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

            temp = copy.deepcopy(cases_format)  # 使用深拷贝创建独立副本
            temp["用例标题"] = title
            temp["所属模块"] = module
            temp["优先级"] = str(random.randint(1, 4))

            # 调用GLM-4生成详情
            details = generate_test_case_details(title)

            # 映射并赋值必需字段
            for target_field, possible_fields in FIELD_MAPPING.items():
                for source_field in possible_fields:
                    if source_field in details and details[source_field]:
                        temp[target_field] = details[source_field]
                        break

            # 调试输出即将写入CSV的数据
            # print(f"\n=== 即将写入CSV的数据 ({title}) ===")
            # print(json.dumps(temp, ensure_ascii=False, indent=2))

            # 追加写入CSV
            with open(csv_file, "a", newline="", encoding="utf-8-sig") as f:  # 使用utf-8-sig编码
                writer = csv.DictWriter(f, fieldnames=cases_format.keys())
                writer.writerow(temp)

            # 记录断点
            with open(breakpoint_file, "a", encoding="utf-8") as f:
                f.write(f"{data}\n")

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
    if not ZHIPU_API_KEY:
        print("❌ 请在.env文件中配置ZHIPU_API_KEY")
        sys.exit(1)

    input_path = f"./FreeMindFiles/{FREEMIND_FILE}"
    output_path = f"./ExcelFiles/{FREEMIND_FILE.split('.')[0]}.csv"

    print(f"开始处理文件: {input_path}")
    freemind_to_cases(input_path, output_path)
