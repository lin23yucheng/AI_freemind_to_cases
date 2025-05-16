import sys
import xml.etree.ElementTree as ET
import csv
import copy
import random

# 是否包含父类节点
INCLUDE_PARENT = False
# 飞书思维导图.mm文件，存放路径为/FreeMindFiles/下
FREEMIND_FILE = '算力管理平台.mm'

cases_format = {
    "所属模块": "",
    "用例标题": "",
    "前置条件": "",
    "步骤": "1.\n2.\n3.\n",
    "预期": "",
    "关键词": "1",
    "优先级": "3",  # 此值将被随机值替代
    "用例类型": "功能测试",  # 功能测试，性能测试，配置相关，安装部署，安全相关，接口测试，单元测试，其他
    "适用阶段": "功能测试阶段"  # 单元测试阶段，功能测试阶段，集成测试阶段，系统测试阶段，冒烟测试阶段，版本验证阶段
}


def freemind_to_cases(freemind_file, csv_file):
    # 解析Freemind文件
    try:
        tree = ET.parse(freemind_file)
    except IOError:
        print(f"{freemind_file}文件不存在！！")
        sys.exit()
    root = tree.getroot()
    case_titles = []
    cases = []

    # 字典列表转csv
    def dict_to_csv(dict_list, filename):
        with open(filename, 'w', newline='', encoding='utf-8') as srcfile:
            fieldnames = dict_list[0].keys()
            writer = csv.DictWriter(srcfile, fieldnames=fieldnames)
            writer.writeheader()
            writer.writerows(dict_list)

    # 当去除父类节点需要进行数据处理
    def remove_parents():
        remove_list = []
        for i in range(len(case_titles) - 1):
            if case_titles[i + 1].find(case_titles[i]) > -1:
                remove_list.append(case_titles[i])
        for remove_data in remove_list:
            case_titles.remove(remove_data)

    # 递归函数遍历Freemind树
    def parse_node(node, parent_text=None):
        topic = node.attrib.get('TEXT')
        if parent_text:
            topic = parent_text + ' - ' + topic
        # 不为空加入数组
        if topic:
            case_titles.append(topic)
        # 递归遍历节点
        for child in node:
            parse_node(child, topic)

    # 解析Freemind树的根节点
    parse_node(root, None)
    if INCLUDE_PARENT is False:
        remove_parents()
    for data in case_titles:
        temp = copy.deepcopy(cases_format)
        character = "- "
        try:
            # 去掉最顶层节点，并且按【模块】格式化
            index = data.index(character) + 2
            temp_string = data.replace(data[:index], "")
            index = temp_string.index(character) - 1
            new_string = "【" + temp_string[:index] + "】" + temp_string[index:]
            temp["用例标题"] = new_string
            temp["所属模块"] = "/" + new_string.split(" - ")[0].replace("【", "").replace("】", "/") + \
                               new_string.split(" - ")[1]
            # 随机生成1-4之间的优先级
            temp["优先级"] = str(random.randint(1, 4))
            # if temp["所属模块"] == "/调试/运动设置":
            #     temp["所属模块"] = "/调试/运动设置(#1616)"
            # elif temp["所属模块"] == "/调试/点位调试":
            #     temp["所属模块"] = "/调试/点位调试(#1617)"
            # elif temp["所属模块"] == "/调试/点位列表":
            #     temp["所属模块"] = "/调试/点位列表(#1618)"
            # elif temp["所属模块"] == "/调试/设置":
            #     temp["所属模块"] = "/调试/设置(#1619)"
            # else:
            #     pass
            cases.append(temp)
        except ValueError:
            pass
    dict_to_csv(cases, csv_file)
    print(f'完成用例【{FREEMIND_FILE.split(".")[0]}.csv】导出操作。。。')


# 示例用法
input_file = f'./FreeMindFiles/{FREEMIND_FILE}'
output_file = f'./ExcelFiles/{FREEMIND_FILE.split(".")[0]}.csv'
freemind_to_cases(input_file, output_file)
