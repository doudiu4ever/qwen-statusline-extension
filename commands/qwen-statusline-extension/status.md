---
description: 查看状态栏安装状态
---

# 查看 Statusline 状态

检查自定义状态栏的安装状态。

## 执行步骤

### 1. 检查脚本文件

使用 `run_shell_command` 执行：

```bash
ls -la ~/.qwen/qwen-statusline.sh 2>/dev/null && echo "EXISTS" || echo "NOT_EXISTS"
```

### 2. 检查备份文件

使用 `run_shell_command` 执行：

```bash
ls -la ~/.qwen/statusline.config.backup 2>/dev/null && echo "EXISTS" || echo "NOT_EXISTS"
```

### 3. 读取 settings.json

使用 `read_file` 读取 `~/.qwen/settings.json`，检查是否有 `ui.statusLine` 配置。

### 4. 显示状态

根据检查结果告诉用户：

**已安装**：
```
✅ Statusline 已安装

📍 脚本位置：~/.qwen/qwen-statusline.sh
⚙️  配置状态：settings.json 中已配置 ui.statusLine
💾 备份状态：无备份（首次安装）

📊 显示效果:
   qwen3.5-plus | qwen (main*) | Total: 1.5K | Cached: 500 (33%)

🗑️  卸载：/qwen-statusline-extension:uninstall
```

**已安装（有备份）**：
```
✅ Statusline 已安装（覆盖了原有配置）

📍 脚本位置：~/.qwen/qwen-statusline.sh
⚙️  配置状态：settings.json 中已配置 ui.statusLine
💾 备份状态：已备份到 ~/.qwen/statusline.config.backup

📊 显示效果:
   qwen3.5-plus | qwen (main*) | Total: 1.5K | Cached: 500 (33%)

🗑️  卸载：/qwen-statusline-extension:uninstall（卸载后会恢复原有配置）
```

**未安装**：
```
❌ Statusline 未安装

📦 安装：/qwen-statusline-extension:install
```

**部分安装**（只有脚本或只有配置）：
```
⚠️  Statusline 配置不完整

📍 脚本：已安装 / 未安装
⚙️  配置：已安装 / 未安装

💡 建议运行 /qwen-statusline-extension:install 重新安装
```
