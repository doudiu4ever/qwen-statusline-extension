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

### 2. 读取当前 settings.json 配置

使用 `read_file` 读取 `~/.qwen/settings.json`。

### 3. 备份原有配置

检查 `ui.statusLine` 是否存在：

**如果 `ui.statusLine` 已存在**：
- 将原有配置保存到 `~/.qwen/statusline.config.backup` 文件
- 告诉用户：`⚠️ 发现原有状态栏配置，已备份到 ~/.qwen/statusline.config.backup`

**如果 `ui.statusLine` 不存在**：
- 无需备份，告诉用户：`✅ 未发现原有状态栏配置`

### 4. 复制脚本到用户目录

使用 `run_shell_command` 执行：

```bash
cp <source-path> ~/.qwen/qwen-statusline.sh
chmod +x ~/.qwen/qwen-statusline.sh
```

### 5. 修改 settings.json

使用 `edit` 或 `write_file` 添加/更新 `ui.statusLine`：

```json
{
  "ui": {
    "statusLine": {
      "type": "command",
      "command": "bash ~/.qwen/qwen-statusline.sh"
    }
  }
}
```

**注意**：保留 `settings.json` 中的其他配置。

### 6. 确认安装完成

告诉用户：
```
✅ Statusline 安装完成！

📊 显示效果:
   qwen3.5-plus | qwen (main*) | Total: 1.5K | Cached: 500 (33%)

🔄 重启 Qwen Code 后生效
🗑️  卸载：/qwen-statusline-extension:uninstall
```

## 注意事项

- 必须先读取 settings.json，根据是否有原有配置决定是否需要备份
- 备份文件只在首次备份时创建，不要覆盖已有的备份
- 修改 settings.json 时保留其他配置
