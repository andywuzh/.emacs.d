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

(use-package lsp-bridge
  :load-path "site-lisp/lsp-bridge"
  :demand t
  :init
  (setq acm-enable-tabnine nil          ; 禁用默认开启的tabnine补全
        ;; lsp-bridge-enable-debug t
        ;; lsp-bridge-log-level 'debug ; 'default 'debug
        lsp-bridge-enable-diagnostics t
        lsp-bridge-find-def-select-in-open-windows t
        ;; lsp-bridge-enable-auto-format-code t
        ;; lsp-bridge-auto-format-code-idle 30

        ;; remote config
        ;; lsp-bridge-enable-with-tramp t
        ;; lsp-bridge-remote-start-automatically t
        ;; lsp-bridge-remote-python-command "/usr/bin/python3"
        ;; lsp-bridge-remote-python-file "/root/lsp-bridge/lsp-bridge.py"
        ;; lsp-bridge-remote-log "/var/log/lsp-bridge/lsp-bridge.log"

        ;; python-lsp-bridge
        ;; ATTENTION lsp-bridge本身使用的python配置, 两种方式
        ;; 1. 使用uv
        ;;   - 软链接site-lisp/lsp-bridge/python-lsp-bridge到某个$PATH下，比如~/.local/bin/python-lsp-bridge
        ;;   - cd site-list/lsp-bridge && uv venv -p 3.13 # venv版本尽量与lsp-bridge/pyproject.toml配置兼容
        ;; 2. 指定python路径，可使用pyenv
        ;; (setq lsp-bridge-python-command "~/.pyenv/versions/3.12.4/bin/python3")

        ;; language server
        ;;  lsp-bridge-user-langserver-dir (expand-file-name "lisp/lsp/langserver" user-emacs-directory)
        ;;  lsp-bridge-user-multiserver-dir (expand-file-name "lisp/lsp/multierver" user-emacs-directory)
        ;; lsp-bridge-python-lsp-server "jedi"
        ;; lsp-bridge-python-multi-lsp-server "jedi_ruff"
        ;; (setq lsp-bridge-python-lsp-server "basedpyright")
        ;; (setq lsp-bridge-python-multi-lsp-server "basedpyright_ruff")
        )
  :bind
  (:map lsp-bridge-mode-map
        ("C-c l r" . lsp-bridge-rename)
        ("C-c l a" . lsp-bridge-code-action)
        ("C-c l f" . lsp-bridge-code-format)
        ("M-]" . lsp-bridge-find-def)
        ("M-[" . lsp-bridge-find-def-return)
        ("C-M-]" . lsp-bridge-find-references)
        )
  :config
  (global-lsp-bridge-mode)
  )

;; 保存时格式化
;; (add-hook 'before-save-hook #'lsp-bridge-code-format)

;; 快捷键
;; (define-key lsp-bridge-mode-map (kbd "C-c l r") #'lsp-bridge-rename)
;; (define-key lsp-bridge-mode-map (kbd "C-c l a") #'lsp-bridge-code-action)
;; (define-key lsp-bridge-mode-map (kbd "C-c l f") #'lsp-bridge-code-format)
;; (define-key lsp-bridge-mode-map (kbd "M-]") #'lsp-bridge-find-def)
;; (define-key lsp-bridge-mode-map (kbd "M-[") #'lsp-bridge-find-def-return)
;; (define-key lsp-bridge-mode-map (kbd "C-M-]") #'lsp-bridge-find-references)

;(global-lsp-bridge-mode)


;; json
(use-package json-mode
  :init
  (setq js-indent-level 2))


(provide 'init-lsp)
;;; init-lsp.el ends here
