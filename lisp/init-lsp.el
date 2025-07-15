;;; init-lsp --- LSP配置
;;; Commentary:
;;; Code:

;; (add-to-list 'load-path "/Users/andy/.emacs.d/site-lisp/lsp-bridge")
(add-to-list 'load-path (concat user-emacs-directory "site-lisp/lsp-bridge"))

(use-package posframe)

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
(setq lsp-bridge-enable-log t)
(setq lsp-bridge-python-command "~/.pyenv/versions/3.12.4/bin/python3")

;; lsp-bridge remote config
(setq lsp-bridge-enable-with-tramp t)
(setq lsp-bridge-remote-start-automatically t)
(setq lsp-bridge-remote-python-command "/usr/bin/python3")
(setq lsp-bridge-remote-python-file "/root/lsp-bridge/lsp-bridge.py")
(setq lsp-bridge-remote-log "/var/log/lsp-bridge/lsp-bridge.log")

(global-lsp-bridge-mode)


;; (setq straight-use-package-mode 1)
;; (use-package lsp-bridge
  ;; :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge" :files (:defaults "*.py" "acm/*" "core/*") :build (:not compile))
  ;; :init
  ;; (global-lsp-bridge-mode))


(provide 'init-lsp)
;;; init-lsp.el ends here
