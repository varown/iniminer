#!/bin/bash

# 脚本保存路径
SCRIPT_PATH="$HOME/iniminer.sh"
LOG_FILE="$HOME/iniminer/iniminer.log"  # 定义日志文件路径
TARGET_DIR="$HOME/iniminer"  # 下载到的文件夹
TARGET_FILE="$TARGET_DIR/iniminer-mac-x64"  # 目标文件名（macOS 版本）
MINER_PID_FILE="$HOME/iniminer/miner.pid"  # 存储矿机进程PID的文件

# 检查是否以 root 用户运行脚本
if [ "$(id -u)" != "0" ]; then
    echo "此脚本需要以 root 用户权限运行。"
    echo "请尝试使用 'sudo -i' 命令切换到 root 用户，然后再次运行此脚本。"
    exit 1
fi

# 创建目标文件夹（如果不存在）
mkdir -p $TARGET_DIR

# 检查依赖（示例：需要 curl 和 unzip）
function check_dependencies() {
    echo "检查依赖..."
    for cmd in curl unzip; do
        if ! command -v $cmd &>/dev/null; then
            echo "$cmd 未安装，请先安装 $cmd。"
            exit 1
        fi
    done
    echo "依赖检查完毕，所有必需工具已安装。"
}

# 主菜单函数
function main_menu() {
    # 首次运行检查依赖
    check_dependencies

    while true; do
        clear
        echo "================================================================"
        echo "脚本免费开源，请勿相信收费"
        echo "================================================================"
        echo "退出脚本，请按键盘 ctrl + C 退出即可"
        echo "请选择要执行的操作:"
        echo "1) 下载并运行矿机"
        echo "2) 查看日志"
        echo "3) 暂停并删除矿机"
        echo "4) 退出"
        read -p "请输入选项 [1-4]: " OPTION

        case $OPTION in
            1) download_and_run_miner ;;
            2) view_logs ;;
            3) stop_and_delete_miner ;;
            4) echo "退出脚本。" ; exit 0 ;;
            *) echo "无效选项，请重新选择。" ;;
        esac
    done
}

# 下载并启动矿机
function download_and_run_miner() {
    # 设置固定的下载地址（macOS 版本）
    URL="https://github.com/Project-InitVerse/miner/releases/download/v1.0.0/iniminer-mac-x64"

    # 使用 curl 下载文件
    echo "正在下载矿机..."
    curl -L -o $TARGET_FILE $URL

    # 检查下载是否成功
    if [ $? -ne 0 ]; then
        echo "下载失败，请检查网络连接和URL。"
        exit 1
    fi

    # 给文件赋予执行权限
    chmod +x $TARGET_FILE

    # 获取用户输入
    read -p "请输入钱包地址：" WALLET_ADDRESS
    read -p "请输入工作名称：" WORKER_NAME
    read -p "请输入CPU线程数（默认不设置线程数，直接回车跳过）：" CPU_THREADS

    # 启动矿机
    if [ -z "$CPU_THREADS" ]; then
        echo "未输入CPU线程数，启动矿机时不指定线程数"
        $TARGET_FILE --pool "stratum+tcp://$WALLET_ADDRESS.$WORKER_NAME@pool-core-testnet.inichain.com:32672" &> $LOG_FILE &
    else
        echo "用户输入的CPU线程数为: $CPU_THREADS"
        $TARGET_FILE --pool "stratum+tcp://$WALLET_ADDRESS.$WORKER_NAME@pool-core-testnet.inichain.com:32672" --cpu-devices "$CPU_THREADS" &> $LOG_FILE &
    fi

    # 获取矿机进程的 PID 并保存到文件中
    MINER_PID=$!
    echo $MINER_PID > $MINER_PID_FILE
    echo "矿机已启动！PID: $MINER_PID"

    # 提示用户按任意键返回主菜单
    read -n 1 -s -r -p "按任意键返回主菜单..."
    main_menu
}

# 查看日志
function view_logs() {
    echo "正在查看矿机日志..."
    if [ -f "$LOG_FILE" ]; then
        tail -n 20 $LOG_FILE
    else
        echo "日志文件不存在，请先启动矿机。"
    fi

    # 提示用户按任意键返回主菜单
    read -n 1 -s -r -p "按任意键返回主菜单..."
    main_menu
}

# 暂停并删除矿机
function stop_and_delete_miner() {
    if [ -f "$MINER_PID_FILE" ]; then
        MINER_PID=$(cat $MINER_PID_FILE)

        echo "正在停止矿机进程 (PID: $MINER_PID)..."
        kill $MINER_PID

        wait $MINER_PID 2>/dev/null
        echo "矿机进程已停止。"

        echo "正在删除矿机文件和日志文件..."
        rm -f $TARGET_FILE $LOG_FILE $MINER_PID_FILE

        echo "矿机已删除。"
    else
        echo "没有运行的矿机进程。请先启动矿机。"
    fi

    # 提示用户按任意键返回主菜单
    read -n 1 -s -r -p "按任意键返回主菜单..."
    main_menu
}

# 运行主菜单
main_menu