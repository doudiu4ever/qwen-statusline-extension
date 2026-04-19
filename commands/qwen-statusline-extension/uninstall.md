---
description: 卸载自定义状态栏配置
---

# 卸载 Statusline

从 Qwen Code 中移除自定义状态栏。

## 执行步骤

### 1. 读取 settings.json

使用 `read_file` 读取 `~/.qwen/settings.json` 的内容。

### 2. 检查备份文件

使用 `run_shell_command` 检查是否存在备份文件：

```bash
ls -la ~/.qwen/statusline.config.backup 2>/dev/null && echo "EXISTS" || echo "NOT_EXISTS"
```

### 3. 恢复原有配置或删除配置

**如果备份文件存在**：
- 读取备份文件，获取原有配置
- 使用 `edit` 或 `write_file` 恢复原有 `ui.statusLine` 配置
- 删除备份文件：`rm ~/.qwen/statusline.config.backup`
- 告诉用户：`✅ 已恢复原有状态栏配置`

**如果备份文件不存在**：
- 删除 `ui.statusLine` 配置
- 如果删除后 `ui` 对象为空，也删除 `ui`
- 告诉用户：`✅ 已删除状态栏配置`

### 4. 删除脚本文件

使用 `run_shell_command` 执行：

```bash
rm -f ~/.qwen/qwen-statusline.sh
```

**注意**：只删除扩展创建的 `qwen-statusline.sh`，不删除其他脚本文件。

### 5. 确认卸载完成

告诉用户：
```
✅ Statusline 卸载完成！

🔄 重启 Qwen Code 后生效
📦 如需重新安装：/qwen-statusline-extension:install
```

## 注意事项

- 先检查备份文件，有备份则恢复，无备份则干净卸载
- 只删除 `qwen-statusline.sh`，不删除其他可能存在的 statusline 脚本
- 保留 `settings.json` 中的其他设置
