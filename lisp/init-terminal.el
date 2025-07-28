;; -*- lexical-binding: t -*-

;;; Package --- Summary
;;; Commentary: 终端配置
;;; Code:

;; (use-package aweshell
;;   :load-path "site-lisp/aweshell"
;;   :bind ("C-`" . aweshell-dedicated-toggle)
;;   )

(use-package vterm
  :ensure t
  :config
  (setq vterm-max-scrollback 100000))
(use-package vterm-toggle
  :ensure t
  :defer t
  :after vterm
  :bind (("C-<escape>" . vterm-toggle)
         ("C-`" . vterm-toggle))
  :config
  (setq vterm-toggle-fullscreen-p nil)
  (add-to-list 'display-buffer-alist
             '((lambda(bufname _) (with-current-buffer bufname (equal major-mode 'vterm-mode)))
                (display-buffer-reuse-window display-buffer-at-bottom)
                ;;(display-buffer-reuse-window display-buffer-in-direction)
                ;;display-buffer-in-direction/direction/dedicated is added in emacs27
                ;;(direction . bottom)
                ;;(dedicated . t)
                (reusable-frames . visible)
                (window-height . 0.3))))

(provide 'init-terminal)
;;; init-terminal.el ends here
