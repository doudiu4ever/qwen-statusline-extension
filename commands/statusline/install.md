---
description: 安装自定义状态栏，显示 git 分支、token 用量和缓存统计
---

# 安装 Statusline

安装自定义状态栏到 Qwen Code。

## 执行步骤

### 1. 检查依赖

首先检查是否安装了 `jq`：

```bash
command -v jq
```

如果没有安装，提示用户：
```
❌ 需要安装 jq，请先运行：
   Ubuntu/Debian: sudo apt install jq
   macOS: brew install jq
```

### 2. 找到脚本源位置

按以下优先级查找 `statusline.sh`：
1. 扩展目录：`<extension-path>/statusline.sh`
2. 用户配置目录：`~/.qwen/statusline.sh`（如果已存在则覆盖）

### 3. 复制脚本到用户目录

使用 `run_shell_command` 执行：

```bash
cp <source-path> ~/.qwen/statusline.sh
chmod +x ~/.qwen/statusline.sh
```

### 4. 读取并修改 settings.json

**文件路径**: `~/.qwen/settings.json`

使用 `read_file` 读取现有配置，然后使用 `edit` 或 `write_file` 添加配置：

**如果文件不存在**，创建：
```json
{
  "ui": {
    "statusLine": {
      "type": "command",
      "command": "bash ~/.qwen/statusline.sh"
    }
  }
}
```

**如果文件存在**，添加/更新 `ui.statusLine`：
```json
{
  "ui": {
    "statusLine": {
      "type": "command",
      "command": "bash ~/.qwen/statusline.sh"
    }
  }
}
```

### 5. 确认安装完成

告诉用户：
```
✅ Statusline 安装完成！

📊 显示效果:
   qwen3.5-plus | qwen (main*) | Total: 1.5K | Cached: 500 (33%)

🔄 重启 Qwen Code 后生效
🗑️  卸载：/qwen-statusline-extension:uninstall
```

## 注意事项

- 修改 `settings.json` 前先读取现有配置，不要覆盖其他设置
- 如果 `ui` 已存在，只添加/更新 `statusLine`
- 建议备份原配置（可选）
