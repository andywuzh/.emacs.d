;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: LSP配置
;;; Code:

(add-to-list 'load-path (concat user-emacs-directory "site-lisp/lsp-bridge"))

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

(require 'lsp-bridge)
;; lsp-bridge basic config
; (setq lsp-bridge-enable-debug t) 	; 测试
(setq acm-enable-tabnine nil)		; 禁用默认开启的tabnine补全

; ATTENTION lsp-bridge本身使用的python配置, 两种方式
; 1. 使用uv                                        ;
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

(global-lsp-bridge-mode)


;; language server
(setq lsp-bridge-python-lsp-server "jedi")
(setq lsp-bridge-python-multi-lsp-server "jedi_ruff")




(provide 'init-lsp)
;;; init-lsp.el ends here
