;;; 开发通用
(use-package magit
  :bind ("C-x g" . magit-status))

(use-package company
  :bind
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous))
  :config
  (setq company-idle-delay 0.3)
  (global-company-mode t))

;;; php
(use-package ac-php)
(use-package company-php)
(use-package php-mode
  :init
  (add-hook 'php-mode-hook
          '(lambda ()
             (company-mode t)

             (require 'company-php)

             (ac-php-core-eldoc-setup)

             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev-code)
                    company-capf company-files))

             (define-key php-mode-map (kbd "M-]")
               'ac-php-find-symbol-at-point)

             (define-key php-mode-map (kbd "M-[")
               'ac-php-location-stack-back))))

(use-package php-cs-fixer)
(use-package flycheck-phpstan)

;;; html/js/vue
(use-package web-mode
  :config
  (setq tab-width 2)
  :hook (use-package emmet-mode))
(use-package prettier)
(use-package js2-mode)
(use-package vue-mode)

(use-package json-mode)
(use-package yaml-mode)

(provide 'init-program)
