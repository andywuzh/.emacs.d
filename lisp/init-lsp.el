;;; init-lsp --- LSP配置
;;; Commentary:
;;; Code:

(add-to-list 'load-path "/Users/andy/.emacs.d/site-lisp/lsp-bridge")

; yasnippet
(use-package yasnippet
  :config
  (yas-global-mode 1))

(require 'lsp-bridge)
(global-lsp-bridge-mode)


(provide 'init-lsp)
;;; init-lsp.el ends here
