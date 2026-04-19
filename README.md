# qwen-statusline-extension

Qwen Code 自定义状态栏扩展，实时显示项目信息和 token 使用统计。

## 功能特性

- 📁 当前项目目录
- 🌿 Git 分支（`*` 标记未提交内容）
- 🤖 当前模型名称
- 📊 Token 用量（K/M 格式化）
- 💾 缓存统计和命中率

## 安装

### 1. 安装扩展

```bash
qwen extensions install https://github.com/doudiu4ever/qwen-statusline-extension
```

### 2. 安装状态栏

在 Qwen Code 中运行：

```
/qwen-statusline-extension:install
```

### 依赖

需要安装 `jq`：

```bash
# Ubuntu/Debian
sudo apt install jq

# macOS
brew install jq
```

## 使用

### 命令

| 命令 | 说明 |
|------|------|
| `/qwen-statusline-extension:install` | 安装状态栏 |
| `/qwen-statusline-extension:uninstall` | 卸载状态栏 |
| `/qwen-statusline-extension:status` | 查看状态 |

### 显示效果

```
qwen3.5-plus | qwen (main*) | Total: 1.5K | Cached: 500 (33%)
```

| 部分 | 说明 |
|------|------|
| `qwen3.5-plus` | 当前使用的模型 |
| `qwen` | 当前项目目录名 |
| `(main*)` | Git 分支，`*` 表示有未提交内容 |
| `Total: 1.5K` | 总 token 用量 |
| `Cached: 500 (33%)` | 缓存命中的 token 数和百分比 |

## 卸载

### 卸载状态栏

在 Qwen Code 中运行：

```
/qwen-statusline-extension:uninstall
```

### 卸载扩展

```bash
qwen extensions uninstall qwen-statusline-extension
```

## 配置

状态栏配置存储在 `~/.qwen/settings.json`：

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

## 开发

### 目录结构

```
qwen-statusline-extension/
├── qwen-extension.json      # 扩展配置
├── statusline.sh            # 状态栏脚本
├── commands/                # 自定义命令
│   └── statusline/
│       ├── install.md
│       ├── uninstall.md
│       └── status.md
└── README.md                # 本文档
```

### 本地测试

1. 克隆本仓库
2. 在 Qwen Code 中运行：
   ```
   qwen extensions install <本地路径>
   ```

## License

MIT
