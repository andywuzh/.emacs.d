;;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: 配置buff
;;; Code:

;; (global-set-key (kbd "C-x C-b") 'ibuffer) ; 替换默认buffer-menu


(use-package bufler
  :ensure t
  :bind
  (:map global-map
        ("C-c b" . bufler-switch-buffer)
        ("C-x C-b" . bufler-list)
        )
  )

(use-package perspective
  :ensure t
  :custom
  (persp-mode-prefix-key (kbd "C-c M-p"))
  :bind
  ("C-x C-b" . persp-list-buffers)
  ("C-x k" . persp-kill-buffer*)
  :init
  (persp-mode)
  )


(provide 'init-buff)
;;; init-buff.el ends here
