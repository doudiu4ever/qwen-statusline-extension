# qwen-statusline-extension

自定义状态栏扩展，显示：
- 📁 当前项目目录
- 🌿 Git 分支（`*` 标记未提交内容）
- 🤖 当前模型名称
- 📊 Token 用量（K/M 格式化）
- 💾 缓存统计和命中率

## 安装

```bash
qwen extensions install https://github.com/doudiu4ever/qwen-statusline-extension
```

## 使用

### 安装状态栏

```
/qwen-statusline-extension:install
```

这会：
1. 检查依赖（`jq`）
2. 复制 `statusline.sh` 到 `~/.qwen/statusline.sh`
3. 修改 `~/.qwen/settings.json` 添加配置
4. 设置脚本执行权限

### 卸载状态栏

```
/qwen-statusline-extension:uninstall
```

这会：
1. 从 `settings.json` 移除状态栏配置
2. 删除 `~/.qwen/statusline.sh` 脚本

### 查看状态

```
/qwen-statusline-extension:status
```

## 显示效果

```
qwen3.5-plus | qwen (main*) | Total: 1.5K | Cached: 500 (33%)
```

| 部分 | 说明 |
|------|------|
| `qwen3.5-plus` | 当前使用的模型 |
| `qwen` | 当前项目目录名 |
| `(main*)` | Git 分支，`*` 表示有未提交内容 |
| `Total: 1.5K` | 总 token 用量（自动 K/M 格式化） |
| `Cached: 500 (33%)` | 缓存命中的 token 数和百分比 |

## 依赖

- `jq` - JSON 解析工具
- `git` - 版本控制
- `awk` - 数学计算（通常系统预装）

### 安装依赖

**Ubuntu/Debian:**
```bash
sudo apt install jq
```

**macOS:**
```bash
brew install jq
```

## 卸载扩展

```bash
qwen extensions uninstall qwen-statusline-extension
```

## 许可证

MIT
