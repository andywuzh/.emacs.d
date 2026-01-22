# Emacs 配置 - Agent 指南

## 项目结构

```
~/.emacs.d/
├── early-init.el          # 预初始化
├── init.el                # 主入口，按顺序加载 lisp/ 模块
├── custom.*.el           # 平台特定配置（不提交）
├── lisp/                  # 配置模块（init-*.el）
├── site-lisp/             # Git submodules
└── .venv/                 # Python 虚拟环境
```

## 命令

```bash
# 初始化
git clone --recurse-submodules <repo> ~/.emacs.d
cd site-lisp/lsp-bridge && uv venv -p 3.13

# 测试
cd site-lisp/lsp-bridge && python test/test.py
M-x lsp-bridge-start-test  # Emacs Lisp

# 维护
git submodule update --remote
rm -rf .cache/ eln-cache/
```

## 代码风格

### 文件结构

```elisp
;;; -*- lexical-binding: t -*-
;;; Package --- Summary
;;; Commentary: 描述
;;; Code:

(provide 'module-name)
;;; module-name.el ends here
```

### 命名

- 常量: `*variable-name*` (defconst)
- 函数: `function-name` (defun)
- 平台变量: `*is-linux*`, `*is-mac*`, `*is-windows*`
- 模块文件: `init-*.el`

### 格式

- 缩进: 2 空格
- 注释: `;;;` 章节标题, `;;` 单行
- 中文注释 + 英文代码

### 依赖

- 使用 `use-package`
- 模块加载顺序见 `init.el`
- 平台检测用 `*is-linux*`, `*is-mac*`, `*is-windows*`

## 模块加载顺序

1. 基础: `init-const`, `init-funcs`, `init-runtime`, `init-elpa`, `init-font`
2. UI: `init-ui`, `init-tab`, `init-buff`, `init-minibuff`
3. 交互: `init-misc`, `init-package`
4. 输入: `init-kbd`, `init-ime`, `init-session`
5. 编辑: `init-meow`
6. 编程: `init-program`, `init-lsp`, `init-terminal`, `init-python`, `init-web`
7. 项目: `init-project`
8. AI: `init-ai`

## 关键配置

- **LSP Bridge**: Python 3.13, 配置在 `lsp/langserver/*.json`
- **平台配置**: `custom.linux.el` / `custom.mac.el` / `custom.windows.el`（不提交）

## 常见问题

- LSP Bridge 路径: 配置 `lsp-bridge-python-command`
- 子模块更新: 使用 `git submodule update --remote`
- 会话损坏: 删除 `easysession/`
- 启动慢: 查看 `*Messages*` buffer