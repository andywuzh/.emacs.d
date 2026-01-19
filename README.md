# Emacs 配置

一个跨平台的模块化 Emacs 配置，专注于现代编辑工作流、编程支持和高效的导航体验。

## ✨ 特性

- **模块化架构**: 配置按功能拆分为多个模块，易于维护和扩展
- **跨平台支持**: 支持 Linux、macOS 和 Windows 平台
- **现代编辑**: 使用 Meow 模态编辑（类似 Vim 的键绑定）
- **编程友好**: 集成 LSP、tree-sitter 和语言特定配置
- **性能优化**: 自定义垃圾回收设置、延迟加载策略
- **Git 集成**: 使用 git submodules 管理外部包

## 📁 目录结构

```
~/.emacs.d/
├── early-init.el          # 预初始化（GC、native compilation）
├── init.el                # 主入口，按顺序加载 lisp/ 模块
├── custom.*.el           # 平台特定配置（不提交到 git）
├── lisp/                  # 自定义配置模块（init-*.el）
├── site-lisp/             # Git submodules（lsp-bridge, EAF, etc.）
└── .venv/                 # Python 虚拟环境（lsp-bridge）
```

## 🚀 快速开始

### 前置要求

- Emacs 28+
- Python 3.12.8（项目默认）
- Git（用于管理 submodules）
- [uv](https://docs.astral.sh/uv/)（推荐，用于 Python 环境）

### 安装步骤

1. **克隆仓库（包含子模块）**

```bash
git clone --recurse-submodules <repository-url> ~/.emacs.d
```

2. **设置 Python 环境（用于 lsp-bridge）**

```bash
cd ~/.emacs.d/site-lisp/lsp-bridge
uv venv -p 3.12.8
```

3. **启动 Emacs**

```bash
emacs
```

首次启动会自动下载并安装所需的 ELPA 包。

## 🔧 配置说明

### 模块加载顺序

配置按以下顺序加载（在 `init.el` 中定义）：

1. **基础**: `init-const`, `init-funcs`, `init-runtime`, `init-elpa`, `init-font`
2. **UI**: `init-ui`, `init-tab`, `init-buff`, `init-minibuff`
3. **交互**: `init-misc`, `init-package`
4. **输入**: `init-kbd`, `init-ime`, `init-session`
5. **编辑**: `init-meow`
6. **编程**: `init-program`, `init-lsp`, `init-terminal`, `init-python`, `init-web`
7. **项目**: `init-project`
8. **AI**: `init-ai`

### 关键配置

#### Native Compilation

- **状态**: 已禁用（`early-init.el` 第 9-12 行）
- **原因**: lsp-bridge 不支持
- **注意**: 不要对 `site-lisp/` 中的包进行编译

#### LSP Bridge

- **Python 环境**: 使用 uv venv (Python 3.13，与项目默认版本 3.12.8 不同)
- **配置文件**: `lisp/lsp/langserver/*.json`
- **调试**: 设置 `lsp-bridge-enable-debug t`

#### 平台特定配置

- Linux: `custom.linux.el`
- macOS: `custom.mac.el`
- Windows: `custom.windows.el`

这些文件不提交到 git，用于个人本机自定义配置。

## 🎨 主要包和工具

### 核心包

- **Meow**: 模态编辑（Vim-like 键绑定）
- **lsp-bridge**: 快速 LSP 客户端
- **tree-sitter**: 语法解析和高亮
- **magit**: Git 接口
- **which-key**: 键绑定提示

### 编程支持

- **yasnippet**: 代码片段
- **projectile**: 项目管理
- **flycheck**: 语法检查
- **prettier**: 代码格式化

### UI 增强

- **catppuccin-theme**: 主题
- **all-the-icons**: 图标
- **highlight-indent-guides**: 缩进指引
- **treemacs**: 文件树

## ⌨️ 快捷键

### Meow 模态编辑

- `SPC` - Leader 键
- `C-c l` - LSP 操作前缀
- `M-]` - 跳转到定义
- `M-[` - 返回定义
- `C-M-]` - 查找引用

### 其他快捷键

- `C-x C-f` - 打开文件
- `C-x b` - 切换 buffer
- `C-x k` - 关闭 buffer
- `C-x C-s` - 保存文件

## 🛠️ 维护

### 更新子模块

```bash
# 更新所有子模块
git submodule update --remote

# 更新单个子模块
git submodule update --remote site-lisp/lsp-bridge
```

### 清理缓存

```bash
rm -rf ~/.emacs.d/.cache/
rm -rf ~/.emacs.d/eln-cache/
```

### 运行测试

```bash
# 运行所有 Python 测试（lsp-bridge）
cd ~/.emacs.d/site-lisp/lsp-bridge && python test/test.py

# 运行单个测试文件
cd ~/.emacs.d/site-lisp/lsp-bridge && python -m pytest test/test_completion.py -v

# 运行单个测试方法
cd ~/.emacs.d/site-lisp/lsp-bridge && python -m pytest test/test_completion.py::TestCompletion::test_method -v
```

## 🔍 故障排除

### LSP Bridge Python 路径问题

确保 `python-lsp-bridge` 在 PATH 中，或配置：

```elisp
(setq lsp-bridge-python-command "/path/to/python")
```

### 子模块更新问题

使用 `git submodule update --remote` 而非 `git pull`。

### 会话损坏

删除 `easysession/` 目录：

```bash
rm -rf ~/.emacs.d/easysession/
```

### 启动慢

检查是否有模块加载失败（查看 `*Messages*` buffer）。

## 📝 自定义

### 添加自定义配置

在平台特定的 `custom.*.el` 文件中添加配置：

```elisp
;;; custom.linux.el --- Custom Linux configuration
;;; Commentary:
;;; Code:

;; 添加你的自定义配置
(setq custom-variable "value")

;;; custom.linux.el ends here
```

### 添加新模块

1. 在 `lisp/` 目录创建 `init-<name>.el`
2. 添加标准文件头：
   ```elisp
   ;;; -*- lexical-binding: t -*-
   ;;; Package --- Summary
   ;;; Commentary: 描述
   ;;; Code:
   ```
3. 在 `init.el` 中添加加载顺序
4. 在文件末尾添加：
   ```elisp
   (provide 'init-<name>)
   ;;; init-<name>.el ends here
   ```

## 🔗 相关资源

- [AGENTS.md](./AGENTS.md) - 给 AI 编码助手的指南
