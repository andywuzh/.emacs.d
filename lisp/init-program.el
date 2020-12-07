;;; 开发通用
(use-package magit
  :bind ("C-x g" . magit-status))

(use-package company-quickhelp)
(use-package company
  :bind
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous))
  :config
  (setq company-minimum-prefix-length 1)
  (setq company-dabbrev-downcase nil)
  (setq company-idle-delay 0.2)
  (add-hook 'company-mode-hook 'company-quickhelp-mode)
  (global-company-mode t))

(use-package projectile
  :init
  (projectile-mode +1)
  (setq projectile-switch-project-action #'projectile-dired)
  (setq projectile-completion-system 'ivy)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
(use-package counsel-projectile
  :init
  (counsel-projectile-mode t)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

(use-package yasnippet
  :commands yas-minor-mode
  :hook ((go-mode php-mode) . yas-minor-mode))

(use-package neotree
  :init
  (global-set-key [f8] 'neotree-toggle))

(use-package treemacs
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode t))
  :bind
  (:map global-map
        ("M-0" . treemacs-select-window)
        ("C-x t t" . treemacs)))
(use-package treemacs-projectile
  :after treemacs projectile)


;;; php
;(use-package ac-php)
;(use-package company-php)
;(use-package php-mode
;  :init
;  ;;;(add-hook 'php-mode-hook 'evil-mode)
;  (add-hook 'php-mode-hook
;            '(lambda ()
;               (require 'flycheck-phpstan)
;               (flycheck-mode t)

;               (company-mode t)
;               (require 'company-php)

;               (ac-php-core-eldoc-setup)

;               (set (make-local-variable 'company-backends)
;                    '((company-ac-php-backend company-dabbrev-code)
;                      company-capf company-files))

;               (define-key php-mode-map (kbd "M-]")
;                 'ac-php-find-symbol-at-point)

;               (define-key php-mode-map (kbd "M-[")
;                 'ac-php-location-stack-back))))

;; (use-package php-cs-fixer)
;; (use-package flycheck-phpstan)

;;; lsp
(use-package lsp-mode
  :config
  (setq
   lsp-completion-provider :capf
   ;lsp-idle-delay 0.500
   lsp-modeline-diagnostics-enable t
   lsp-auto-guess-root t
   ;lsp-log-io t
   )
  :commands (lsp lsp-deferred)
  :hook
  ((web-mode
    go-mode
    php-mode) . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration))


(use-package lsp-ui :commands lsp-ui-mode)
(use-package lsp-treemacs
  :init
  (setq lsp-treemacs-sync-mode 1)
  :commands lsp-treemacs-errors-list)

;;; golang
;(use-package go-mode)
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)


;;; html/js/vue
(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  :config
  (add-hook 'web-mode-hook 'company-mode)
  (add-hook 'web-mode-hook 'emmet-mode)
  ;; (add-hook 'web-mode-hook 'evil-mode)
  (add-hook 'web-mode-hook 'lsp-mode))

;; (use-package prettier)
;; (use-package js2-mode)
;; (use-package vue-mode)

;; (use-package json-mode)
;; (use-package yaml-mode)

(provide 'init-program)
