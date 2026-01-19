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

;; AI Code Interface
(use-package ai-code
  :config
  (ai-code-set-backend 'opencode)
  (global-set-key (kbd "C-c a") #'ai-code-menu)
  (global-auto-revert-mode 1)
  (setq auto-revert-interval 1)
  (with-eval-after-load 'magit
    (ai-code-magit-setup-transients)))

(provide 'init-ai)
;;; init-ai.el ends here
