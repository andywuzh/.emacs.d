(use-package restart-emacs)
(use-package session
  :init
  (add-hook 'after-init-hook 'session-initialize)
  (desktop-save-mode t))

(use-package which-key
  :defer nil
  :config (which-key-mode))

(provide 'init-package)
