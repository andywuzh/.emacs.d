# Emacs 配置

跨平台模块化 Emacs 配置。

## 目录结构

```
~/.emacs.d/
├── early-init.el          # 预初始化
├── init.el                # 主入口
├── custom.*.el           # 平台特定配置（不提交）
├── lisp/                  # 配置模块
├── site-lisp/             # Git submodules
└── .venv/                 # Python 虚拟环境
```

## 初始化

```bash
# 克隆
git clone --recurse-submodules <repo> ~/.emacs.d

# 设置 LSP Bridge Python 环境
cd ~/.emacs.d/site-lisp/lsp-bridge
uv venv -p 3.13
```

## 关键配置

- **LSP Bridge**: Python 3.13，配置在 `lsp/langserver/*.json`
- **平台配置**: `custom.linux.el` / `custom.mac.el` / `custom.windows.el`
- **模块加载顺序**: 见 `init.el`

## 维护

```bash
# 更新子模块
git submodule update --remote

# 清理缓存
rm -rf ~/.emacs.d/.cache/ eln-cache/
```

## 常见问题

- **LSP Bridge**: 配置 `lsp-bridge-python-command`
- **会话损坏**: 删除 `easysession/`
- **启动慢**: early-init.el中打开调试，重新启动后查看 `*Messages*` buffer

---

参考 [AGENTS.md](./AGENTS.md) 了解开发规范。
