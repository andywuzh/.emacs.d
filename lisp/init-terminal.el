;; -*- lexical-binding: t -*-

;;; Package --- Summary
;;; Commentary: 终端配置
;;; Code:

(use-package aweshell
  :load-path "site-lisp/aweshell"
  :bind ("C-`" . aweshell-dedicated-toggle)
  )

(provide 'init-terminal)
;;; init-terminal.el ends here
