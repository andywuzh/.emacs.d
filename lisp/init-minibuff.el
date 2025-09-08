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

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion))))
  )

(provide 'init-minibuff)
;;; init-minibuff.el ends here
