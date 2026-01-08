;;; Package --- Summary  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (use-package exec-path-from-shell
;;   :if
;;   (memq window-system '(mac ns x))
;;   :config
;;   (dolist (var '("PATH" "MANPATH" "LANG" "LC_CTYPE"))
;;     (add-to-list 'exec-path-from-shell-variables var))
;;   (setq exec-path-from-shell-arguments nil)
;;   (exec-path-from-shell-initialize))

;; (use-package restart-emacs)

;; (use-package desktop
;;   :ensure nil
;;   :init
;;   ;;(setq desktop-path (expand-file-name ".cache" user-emacs-directory)
;;   ;;      desktop-base-file-name (concat ".emacs.desktop." system-configuration)
;;   ;;      desktop-base-lock-name (concat ".emacs.desktop." system-configuration ".lock"))
;;   (setq desktop-restore-frames t
;;         desktop-restore-eager 5
;;         )
;;   (desktop-save-mode t)
;;   )

(use-package which-key
  :ensure nil
  :defer nil
  :custom
  (which-key-idle-delay 1.0)
  :hook
  (after-init . which-key-mode))

;; (use-package evil
  ;; :init
  ;; (evil-mode 1)
  ;; (define-key evil-normal-state-map (kbd "C-e") 'move-end-of-line)
  ;;;; 在部分mode中初始化evil-mode时为emacs state
  ;; (evil-set-initial-state 'emacs-lisp-mode 'emacs)
  ;; (cl-loop for mode in '(eshell-mode shell-mode term-mode help-mode neotree-mode dired-mode emacs-lisp-mode buffer-menu-mode)
           ;; do (evil-set-initial-state mode 'emacs)))

;; (use-package counsel
;;   :init
;;   (ivy-mode 1)
;;   :config
;;   (setq ivy-use-virtual-buffers t)
;;   (setq ivy-count-format "(%d/%d) ")
;;   (global-set-key (kbd "C-s") 'swiper-isearch)
;;   (global-set-key (kbd "M-x") 'counsel-M-x)
;;   (global-set-key (kbd "C-x C-f") 'counsel-find-file)
;;   (global-set-key (kbd "C-c c r") 'counsel-rg)
;;   (global-set-key (kbd "C-c c f") 'counsel-fzf)
;;   (global-set-key (kbd "C-c c g") 'counsel-git)
;;   (global-set-key (kbd "M-y") 'counsel-yank-pop)
;;   (global-set-key (kbd "C-x b") 'ivy-switch-buffer))

;; (use-package rg
;;   :ensure t
;;   :init
;;   (rg-enable-default-bindings))

;; (use-package keyfreq
;;   :init
;;   (keyfreq-mode 1)
;;   (keyfreq-autosave-mode 1)
;;   (setq keyfreq-excluded-commands
;;         '(self-insert-command
;;           forward-char
;;           backward-char
;;           previous-line
;;           next-line)))

;;(use-package evil-matchit
  ;;:init
  ;;(global-evil-matchit-mode 1))

;; (use-package ibuffer-projectile
;;   :after projectile
;;   :hook ((ibuffer . (lambda ()
;;                       (ibuffer-projectile-set-filter-groups)
;;                       (unless (eq ibuffer-sorting-mode 'alphabetic)
;;                         (ibuffer-do-sort-by-alphabetic)))))
;;   :config
;;   (setq ibuffer-projectile-prefix "Project: "))

(provide 'init-package)
;;; init-package.el ends here
