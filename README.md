# initVerse

initVerse 是一个用于xx的脚本，支持 macOS 和 Linux 系统。该脚本可以帮助用户下载并运行initVerse

## 使用方法

### macOS

1. 下载并运行脚本：

    ```sh
    wget -O initVerse.sh https://raw.githubusercontent.com/varown/initVerse/refs/heads/master/iniminer-mac.sh && tr -d '\r' < initVerse.sh > initVerse_clean.sh && chmod +x initVerse_clean.sh && ./initVerse_clean.sh
    ```

2. 按照提示选择操作

### Linux

1. 下载并运行脚本：

    ```sh
   wget -O initVerse.sh https://raw.githubusercontent.com/varown/initVerse/refs/heads/master/iniminer.sh && sed -i 's/\r//' initVerse.sh && chmod +x initVerse.sh && ./initVerse.sh
    ```

2. 按照提示选择操作等。

## 功能

### 主菜单

脚本提供以下功能：

1. 下载并运行x机
2. 查看日志
3. 暂停并删除x机
4. 重启x机（仅 Linux 版本）
5. 退出

### 下载并运行x机

脚本会从指定的 URL 下载x机文件，并根据用户输入的钱包地址、工作名称(随便命名)和 CPU 线程数启动x机。

### 查看日志

脚本会显示x机的最新日志信息，帮助用户了解x机的运行状态。

### 暂停并删除x机

脚本会停止x机进程，并删除x机文件和日志文件。

### 重启（仅 Linux 版本）

脚本会重启x机进程，适用于需要重新启动x机的情况。

## 注意事项

- 运行脚本需要 root 用户权限，请使用 `sudo` 命令运行脚本。
- 请确保系统已安装必要的依赖工具，例如 `curl`、`unzip`（macOS）和 `wget`、`pm2`（Linux）。

## 开源协议

该项目免费开源，请勿相信任何收费行为。
