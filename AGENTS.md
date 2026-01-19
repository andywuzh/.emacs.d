# Emacs Configuration Project - Agent Guide

## 项目概述

跨平台 Emacs 配置，使用模块化架构（`lisp/`）和手动维护的第三方包（`site-lisp/`）。

## 目录结构

```
~/.emacs.d/
├── early-init.el          # 预初始化（GC、native compilation）
├── init.el                # 主入口，按顺序加载 lisp/ 模块
├── custom.*.el            # 平台特定配置（不提交到 git）
├── lisp/                  # 自定义配置模块（init-*.el）
├── site-lisp/             # Git submodules（lsp-bridge, EAF, etc.）
└── .venv/                 # Python 虚拟环境（lsp-bridge）
```

## 构建和测试命令

### 初始化设置

```bash
# 克隆项目（含子模块）
git clone --recurse-submodules <repo-url> ~/.emacs.d

# 设置 lsp-bridge Python 环境
cd site-lisp/lsp-bridge
uv venv -p 3.13
```

### 测试命令

```bash
# 运行所有 Python 测试（lsp-bridge）
cd site-lisp/lsp-bridge && python test/test.py

# 运行单个测试文件
cd site-lisp/lsp-bridge && python -m pytest test/test_completion.py -v

# 运行单个测试方法
cd site-lisp/lsp-bridge && python -m pytest test/test_completion.py::TestCompletion::test_method -v

# Emacs Lisp 测试
M-x lsp-bridge-start-test
```

### 维护命令

```bash
# 更新所有子模块
git submodule update --remote

# 更新单个子模块
git submodule update --remote site-lisp/lsp-bridge

# 清理缓存
rm -rf .cache/ eln-cache/
```

## 代码风格规范

### 文件结构

- **第一行**: `;;; -*- lexical-binding: t -*-` （必须）
- **头部**:
  ```elisp
  ;;; Package --- Summary
  ;;; Commentary: 简短描述
  ;;; Code:
  ```
- **结尾**: `(provide 'module-name)` 和 `;;; module-name.el ends here`

### 命名约定

- **常量**: `*variable-name*` (使用 `defconst`)
- **函数**: `function-name` (使用 `defun`)
- **平台变量**: `*is-linux*`, `*is-mac*`, `*is-windows*`
- **模块文件**: `init-*.el` 格式

### 导入和依赖

- 使用 `use-package` 管理包配置
- 模块加载顺序遵循 `init.el` 中的依赖关系
- 平台检测使用 `init-const.el` 中的常量

### 格式化

- 缩进: 2 空格（Emacs Lisp 默认）
- 对齐: 使用 `M-x align-region` 对齐列表
- 注释:
  - `;;;` - 章节标题
  - `;;` - 单行注释
  - 中文注释 + 英文代码

### 错误处理

- 使用 `when` 和 `unless` 进行条件判断
- 平台特定代码: `(when *is-linux* ...)`
- 文件存在检查: `(when (file-exists-p file) ...)`

## 模块加载顺序

init.el 中的加载顺序（不可更改）：

1. 基础: `init-const`, `init-funcs`, `init-runtime`, `init-elpa`, `init-font`
2. UI: `init-ui`, `init-tab`, `init-buff`, `init-minibuff`
3. 交互: `init-misc`, `init-package`
4. 输入: `init-kbd`, `init-ime`, `init-session`
5. 编辑: `init-meow`
6. 编程: `init-program`, `init-lsp`, `init-terminal`, `init-python`, `init-web`
7. 项目: `init-project`
8. AI: `init-ai`

## 关键配置说明

### Native Compilation

- **状态**: 已禁用（`early-init.el` 第 9-12 行）
- **原因**: lsp-bridge 不支持
- **注意**: 不要对 site-lisp/ 中的包进行编译

### LSP Bridge

- **Python 环境**: 使用 uv venv (Python 3.13)
- **配置文件**: `lsp/langserver/*.json`
- **调试**: 设置 `lsp-bridge-enable-debug t`

### 平台特定配置

- Linux: `custom.linux.el`
- macOS: `custom.mac.el`
- Windows: `custom.windows.el`
- 这些文件不提交到 git，但通过 Syncthing 同步

## 常见问题

1. **LSP Bridge Python 路径**: 确保 `python-lsp-bridge` 在 PATH 中或配置 `lsp-bridge-python-command`
2. **子模块更新**: 使用 `git submodule update --remote` 而非 `git pull`
3. **会话损坏**: 删除 `easysession/` 目录
4. **启动慢**: 检查是否有模块加载失败（查看 _Messages_ buffer）
