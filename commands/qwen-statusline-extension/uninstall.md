---
description: 卸载自定义状态栏配置
---

# 卸载 Statusline

从 Qwen Code 中移除自定义状态栏。

## 执行步骤

### 1. 读取 settings.json

使用 `read_file` 读取 `~/.qwen/settings.json` 的内容。

### 2. 删除 statusLine 配置

使用 `edit` 或 `write_file` 删除 `ui.statusLine` 配置：

**如果 `ui.statusLine` 存在**：
- 删除 `statusLine` 字段
- 如果删除后 `ui` 对象为空，也删除 `ui`

**如果 `ui.statusLine` 不存在**：
- 告诉用户：`⚠️ 未找到 statusLine 配置`

### 3. 删除脚本文件

使用 `run_shell_command` 执行：

```bash
rm -f ~/.qwen/qwen-statusline.sh
```

### 4. 确认卸载完成

告诉用户：
```
✅ Statusline 卸载完成！

🔄 重启 Qwen Code 后生效
📦 如需重新安装：/qwen-statusline-extension:install
```

## 注意事项

- 只删除 `statusLine` 相关配置，保留 `settings.json` 中的其他设置
- 操作前可以建议用户备份配置（可选）
