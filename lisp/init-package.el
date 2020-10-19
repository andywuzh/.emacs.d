(use-package restart-emacs)
(use-package session
  :init
  (add-hook 'after-init-hook 'session-initialize)
  (desktop-save-mode t))

(use-package which-key
  :defer nil
  :config (which-key-mode))

(use-package editorconfig
  :config
  (editorconfig-mode 1))

;; (use-package cnfonts
  ;; (cnfonts-enable))

(provide 'init-package)
