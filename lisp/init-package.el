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

(use-package evil
  :init (evil-mode 1))

(use-package counsel
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer))


(provide 'init-package)
