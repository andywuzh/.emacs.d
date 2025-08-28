;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: AI配置
;;; Code:

;; claude code
(use-package claude-code
  :ensure t
  :init
  (setq yas-triggers-in-field t)
  :config
  (yas-global-mode 1)
  :bind
  (:map global-map
        ("C-c c" . claude-code-transient))
  )

(provide 'init-ai)
;;; init-ai.el ends here
