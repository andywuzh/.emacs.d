;;; init-program --- 编程配置
;;; Commentary:
;;; Code:

;;; 开发通用
(use-package magit
  :bind ("C-x g" . magit-status))

; company
(use-package company-quickhelp)
(use-package company
  :bind
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous))
  :init
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.2
        company-tooltip-align-annotations t
        ;company-show-numbers t
        ;company-tooltip-limit 20
        company-dabbrev-downcase nil
        )
  :hook
  (company-mode . company-quickhelp-mode)
  :config
  (global-company-mode t))

; projectile
(use-package projectile
  :init
  (projectile-mode +1)
  (setq projectile-switch-project-action #'projectile-dired
        projectile-completion-system 'ivy)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
(use-package counsel-projectile
  :init
  (counsel-projectile-mode t)
  (define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))

; yasnippet
(use-package yasnippet
  :config
  (yas-global-mode 1)
  :commands yas-minor-mode
  :hook ((go-mode php-mode) . yas-minor-mode))
(use-package yasnippet-snippets
  :after yasnippet)

(use-package neotree
  :init
  (global-set-key [f8] 'neotree-toggle))

; treemacs
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

(use-package flycheck
  :init
  (setq flycheck-emacs-lisp-load-path 'inherit)
  :config
  (global-flycheck-mode))

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
;(add-hook 'php-mode-hook '(lambda ()
;                            (add-hook 'before-save-hook 'php-cs-fixer-before-save)
;                            ))

;;; lsp
(use-package lsp-mode
  :config
  (setq
   lsp-enable-snippet t
   lsp-completion-provider :capf
   ;lsp-idle-delay 0.500
   lsp-modeline-diagnostics-enable t
   lsp-auto-guess-root t
   lsp-enable-file-watchers t
   lsp-response-timeout 30
   ;lsp-log-io t
   )
  :commands (lsp lsp-deferred)
  :hook
  ((web-mode
    go-mode
    php-mode
    web-mode) . lsp-deferred)
  (lsp-mode . lsp-enable-which-key-integration))

(use-package lsp-ui
  :after
  (lsp-mode)
  :commands
  (lsp-ui-mode)
  :bind
  (:map lsp-ui-mode-map
        ([remap xref-find-references] . lsp-ui-peek-find-references)
        ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
        ("C-c u" . lsp-ui-imenu)
        ("M-]" . lsp-ui-peek-find-definitions)
        ("M-[" . lsp-ui-peek-jump-backward)
        ("C-c r" . lsp-ui-peek-find-references))
  :hook
  (lsp-mode . lsp-ui-mode)
  :init
  (setq lsp-enable-symbol-highlighting t
        lsp-ui-doc-enable t
        lsp-lens-enable t))
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
  ;; (add-hook 'web-mode-hook 'lsp-mode)
  )

;; (use-package prettier)
;; (use-package js2-mode)
;; (use-package vue-mode)

;; (use-package json-mode)
;; (use-package yaml-mode)

(provide 'init-program)
