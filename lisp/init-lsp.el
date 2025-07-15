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
; (setq lsp-bridge-enable-log t)
(setq lsp-bridge-python-command "~/.pyenv/versions/3.12.4/bin/python3")

;; language server
(setq lsp-bridge-python-lsp-server "jedi")


;; lsp-bridge remote config
;(setq lsp-bridge-enable-with-tramp t)
;(setq lsp-bridge-remote-start-automatically t)
;(setq lsp-bridge-remote-python-command "/usr/bin/python3")
;(setq lsp-bridge-remote-python-file "/root/lsp-bridge/lsp-bridge.py")
;(setq lsp-bridge-remote-log "/var/log/lsp-bridge/lsp-bridge.log")

(global-lsp-bridge-mode)


(provide 'init-lsp)
;;; init-lsp.el ends here
