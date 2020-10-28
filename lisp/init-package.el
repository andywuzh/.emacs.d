(use-package restart-emacs)
(use-package session
  :init
  (setq session-save-file (expand-file-name ".emacs.session" (getenv "HOME")))
  (add-hook 'after-init-hook 'session-initialize)
  (desktop-save-mode t))

(use-package which-key
  :defer nil
  :config (which-key-mode))

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(use-package evil)
;;; 在部分mode中初始化evil-mode时为emacs state
;(loop for (mode . state) in '((shell-mode . emacs)
;                              (help-mode . emacs))
;      do (evil-set-initial-state mode state))
(evil-set-initial-state 'shell-mode 'emacs)

(use-package counsel
  :init
  (ivy-mode 1)
  :config
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (global-set-key (kbd "C-s") 'swiper-isearch)
  (global-set-key (kbd "M-x") 'counsel-M-x)
  (global-set-key (kbd "C-x C-f") 'counsel-find-file)
  (global-set-key (kbd "C-c c r") 'counsel-rg)
  (global-set-key (kbd "C-c c f") 'counsel-fzf)
  (global-set-key (kbd "C-c c g") 'counsel-git)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)
  (global-set-key (kbd "C-x b") 'ivy-switch-buffer))


(provide 'init-package)
