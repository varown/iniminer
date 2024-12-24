# Iniminer

Iniminer 是一个用于xx的脚本，支持 macOS 和 Linux 系统。该脚本可以帮助用户下载并运行矿机，查看日志，暂停并删除矿机等操作。

## 文件结构

- `iniminer-mac.sh`: 适用于 macOS 系统的xx脚本。
- `iniminer.sh`: 适用于 Linux 系统的xx脚本。
- `README.md`: 项目说明文件。

## 使用方法

### macOS

1. 下载并运行脚本：

    ```sh
wget -O iniminer.sh https://raw.githubusercontent.com/varown/iniminer/refs/heads/master/iniminer-mac.sh && sed -i 's/\r//' iniminer.sh && chmod +x iniminer.sh && ./iniminer.sh
    ```

2. 按照提示选择操作，例如下载并运行矿机、查看日志、暂停并删除矿机等。

### Linux

1. 下载并运行脚本：

    ```sh
   wget -O iniminer.sh https://raw.githubusercontent.com/varown/iniminer/refs/heads/master/iniminer.sh && sed -i 's/\r//' iniminer.sh && chmod +x iniminer.sh && ./iniminer.sh
    ```

2. 按照提示选择操作，例如下载并运行矿机、查看日志、暂停并删除矿机等。

## 功能

### 主菜单

脚本提供以下功能：

1. 下载并运行矿机
2. 查看日志
3. 暂停并删除矿机
4. 重启矿机（仅 Linux 版本）
5. 退出

### 下载并运行矿机

脚本会从指定的 URL 下载矿机文件，并根据用户输入的钱包地址、工作名称和 CPU 线程数启动矿机。

### 查看日志

脚本会显示矿机的最新日志信息，帮助用户了解矿机的运行状态。

### 暂停并删除矿机

脚本会停止矿机进程，并删除矿机文件和日志文件。

### 重启矿机（仅 Linux 版本）

脚本会重启矿机进程，适用于需要重新启动矿机的情况。

## 注意事项

- 运行脚本需要 root 用户权限，请使用 `sudo` 命令运行脚本。
- 请确保系统已安装必要的依赖工具，例如 `curl`、`unzip`（macOS）和 `wget`、`pm2`（Linux）。

## 开源协议

该项目免费开源，请勿相信任何收费行为。
