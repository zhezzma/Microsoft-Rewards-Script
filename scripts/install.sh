#!/bin/bash

# 定义工作目录
WORKSPACE_DIR="/root/workspace/microsoft-rewards-script"

# 检查目录是否存在
if [ -d "$WORKSPACE_DIR" ]; then
    # 进入工作目录
    cd "$WORKSPACE_DIR" || exit

    # 执行 npm install
    npm install

    npm run build

    # 输出成功信息
    echo "npm install completed successfully in $WORKSPACE_DIR"
else
    # 输出错误信息
    echo "Directory $WORKSPACE_DIR does not exist."
    exit 1
fi