;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: LSP配置
;;; Code:

(add-to-list 'load-path (expand-file-name "site-lisp/lsp-bridge" user-emacs-directory))

;; (use-package posframe)

; yasnippet
(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-do)))

;; (require 'lsp-bridge)
;; lsp-bridge basic config
;; (setq lsp-bridge-enable-debug t) 	; 测试
;; (setq lsp-bridge-log-level 'debug) 	; 日志等级
;; (setq lsp-bridge-user-langserver-dir (expand-file-name "lisp/lsp/langserver" user-emacs-directory))
;; (setq lsp-bridge-user-multiserver-dir (expand-file-name "lisp/lsp/multierver" user-emacs-directory))

; ATTENTION lsp-bridge本身使用的python配置, 两种方式
; 1. 使用uv
;   - 软链接site-lisp/lsp-bridge/python-lsp-bridge到某个$PATH下，比如~/.local/bin/python-lsp-bridge
;   - cd site-list/lsp-bridge && uv venv -p 3.13 # venv版本尽量与lsp-bridge/pyproject.toml配置兼容
; 2. 指定python路径，可使用pyenv
; (setq lsp-bridge-python-command "~/.pyenv/versions/3.12.4/bin/python3")

;; lsp-bridge remote config
;(setq lsp-bridge-enable-with-tramp t)
;(setq lsp-bridge-remote-start-automatically t)
;(setq lsp-bridge-remote-python-command "/usr/bin/python3")
;(setq lsp-bridge-remote-python-file "/root/lsp-bridge/lsp-bridge.py")
;(setq lsp-bridge-remote-log "/var/log/lsp-bridge/lsp-bridge.log")

;; 保存时格式化
;; (add-hook 'before-save-hook #'lsp-bridge-code-format)
;; (setq lsp-bridge-enable-auto-format-code t)
;; (setq lsp-bridge-auto-format-code-idle 30)
(setq lsp-bridge-find-def-select-in-open-windows t)

;; 快捷键
;; (define-key lsp-bridge-mode-map (kbd "C-c l r") #'lsp-bridge-rename)
;; (define-key lsp-bridge-mode-map (kbd "C-c l a") #'lsp-bridge-code-action)
;; (define-key lsp-bridge-mode-map (kbd "C-c l f") #'lsp-bridge-code-format)
;; (define-key lsp-bridge-mode-map (kbd "M-]") #'lsp-bridge-find-def)
;; (define-key lsp-bridge-mode-map (kbd "M-[") #'lsp-bridge-find-def-return)
;; (define-key lsp-bridge-mode-map (kbd "C-M-]") #'lsp-bridge-find-references)

;; 交互体验
(setq lsp-bridge-enable-diagnostics t)
(setq acm-enable-tabnine nil)		; 禁用默认开启的tabnine补全

;; (global-lsp-bridge-mode)


;;; language server
;; python
;; (setq lsp-bridge-python-lsp-server "jedi")
(setq lsp-bridge-python-multi-lsp-server nil)
(setq lsp-bridge-python-lsp-server "basedpyright")
;; (setq lsp-bridge-python-multi-lsp-server "basedpyright_ruff")


;; json
(use-package json-mode
  :init
  (setq js-indent-level 2))


(provide 'init-lsp)
;;; init-lsp.el ends here
