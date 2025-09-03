;;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: 配置minibuff
;;; Code:

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  (vertico-resize t)
  :config
  (vertico-mode 1)
  )

(provide 'init-minibuff)
;;; init-minibuff.el ends here
