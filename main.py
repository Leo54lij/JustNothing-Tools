import sys

import src

import src.boot
import src.features
import src.features.get_started
import src.features.modules
from src.init_utils import *



SCRIPT_FILE_NAME = f"script:{__name__}"


try:
    src.boot.load()
except:
    write_log(SCRIPT_FILE_NAME,pid,4,"工具箱启动失败......!\n错误信息：\n"+traceback.format_exc())
    console.print(err_color+"工具箱启动失败了！")
    time.sleep(2)
    console.print_exception()
    pause("错误日志已经显示出来了，按任意键退出")
    exit(0)

if firststart:
    src.features.get_started.set_settings()
    print(info_color+"3秒后进入引导......")
    time.sleep(3)

print("3秒后进入主菜单......")
time.sleep(3)

src.features.modules.load_module_menu("module1")

