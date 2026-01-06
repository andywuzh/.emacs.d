;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: LSP配置
;;; Code:

(add-to-list 'load-path (expand-file-name "site-lisp/lsp-bridge" user-emacs-directory))

;; (use-package posframe)

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
  (setq
   ;; debug
   ;; lsp-bridge-enable-debug t
   ;; lsp-bridge-log-level 'debug ; 'default 'debug
   lsp-bridge-find-def-select-in-open-windows t
   ;; lsp-bridge-enable-auto-format-code t
   ;; lsp-bridge-auto-format-code-idle 30

   ;; diagnostics
   lsp-bridge-enable-diagnostics t
   lsp-bridge-enable-hover-diagnostic t

   ;; acm
   acm-enable-tabnine nil          ; 禁用默认开启的tabnine补全
   acm-enable-doc t

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
   ;;   - cd site-lisp/lsp-bridge && uv venv -p 3.13 # venv版本尽量与lsp-bridge/pyproject.toml配置兼容
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


(use-package emmet-mode
  :ensure t)

;; html/js/vue
(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  :config
  (setq web-mode-script-padding 0       ; <script>下不缩进
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t
        web-mode-comment-style 2)
  (setq-default web-mode-comment-formats
                '(("javascript" . "//")))
  :hook
  ;; (web-mode . company-mode)
  (web-mode . emmet-mode)
  (web-mode . prettier-mode))

(add-hook 'web-mode-hook '(lambda ()
                            ;; (setq web-mode-script-padding 0) ; <script>下不缩进
                            (setq tab-width 2)
                            (setq c-basic-offset 2)))


(provide 'init-lsp)
;;; init-lsp.el ends here
