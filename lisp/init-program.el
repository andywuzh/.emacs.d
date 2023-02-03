;;; init-program --- 编程配置
;;; Commentary:
;;; Code:

;;; 开发通用
(use-package magit
  :bind ("C-x g" . magit-status))
(use-package git-gutter
  :init
  (global-git-gutter-mode +1)
  (setq git-gutter:modified-sign "  "
        git-gutter:added-sign "++"
        git-gutter:deleted-sign "--"
        git-gutter:visual-line t
        git-gutter:hide-gutter t
        git-gutter:disabled-modes '(asm-mode image-mode))
  (set-face-background 'git-gutter:modified "purple")
  (set-face-background 'git-gutter:added "green")
  (set-face-background 'git-gutter:deleted "red"))

; tree-sitter
(use-package tree-sitter)
(use-package tree-sitter-langs
  :init
  (global-tree-sitter-mode))


; company
(use-package company-quickhelp)
(use-package company
  :bind
  (:map company-active-map
        ("C-n" . company-select-next)
        ("C-p" . company-select-previous))
  :init
  (setq company-minimum-prefix-length 1
        company-idle-delay 0            ; setting 0 while using native-compile
        company-tooltip-align-annotations t
        company-show-numbers t
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

; ; yasnippet
; (use-package yasnippet
;   :config
;   (yas-global-mode 1)
;   :commands yas-minor-mode
;   :hook ((go-mode php-mode) . yas-minor-mode))
; (use-package yasnippet-snippets
;   :after yasnippet)

;; (use-package neotree
;;   :init
;;   (global-set-key [f8] 'neotree-toggle))

; treemacs
(use-package treemacs
  :config
  (setq treemacs-collapse-dirs (if treemacs-python-executable 3 0)
        treemacs-missing-project-action 'remove
        treemacs-sorting 'alphabetic-asc
        treemacs-follow-after-init t
        ;; treemacs-width 50
        )
  (treemacs-follow-mode t)
  (treemacs-filewatch-mode t)
  (treemacs-fringe-indicator-mode 'always)
  (treemacs-git-mode 'deferred)
  (define-key treemacs-mode-map (kbd "j") 'treemacs-next-line)
  (define-key treemacs-mode-map (kbd "k") 'treemacs-previous-line)
  ;; (with-eval-after-load 'winum
  ;;   (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :commands (treemacs-follow-mode
            treemacs-filewatch-mode
            treemacs-fringe-indicator-mode
            treemacs-git-mode)
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
;;; php
; (use-package php-mode)

;;; lsp
; (use-package lsp-mode
;   :config
;   (setq
;    lsp-enable-snippet t
;    lsp-use-plists t
;    lsp-completion-provider :capf
;    lsp-idle-delay 0.500
;    lsp-modeline-diagnostics-enable t
;    lsp-auto-guess-root t
;    lsp-enable-file-watchers t
;    lsp-response-timeout 30
;    lsp-log-io nil
;    lsp-vetur-format-default-formatter-css "none"
;    lsp-vetur-format-default-formatter-html "none"
;    lsp-vetur-format-default-formatter-js "none"
;    lsp-vetur-validation-template nil)
;   :commands
;   (lsp lsp-deferred)
;   :hook
;   ((web-mode go-mode php-mode java-mode) . lsp)
;   (lsp-mode . lsp-enable-which-key-integration))

; (use-package lsp-ui
;   :after
;   (lsp-mode)
;   :commands
;   (lsp-ui-mode)
;   :bind
;   (:map lsp-ui-mode-map
;         ([remap xref-find-references] . lsp-ui-peek-find-references)
;         ([remap xref-find-definitions] . lsp-ui-peek-find-definitions)
;         ("C-c u" . lsp-ui-imenu)
;         ("M-]" . lsp-ui-peek-find-definitions)
;         ("M-[" . lsp-ui-peek-jump-backward)
;         ("C-c r" . lsp-ui-peek-find-references)
;         ("C-c f" . lsp-format-buffer))
;   :hook
;   (lsp-mode . lsp-ui-mode)
;   :init
;   (setq lsp-enable-symbol-highlighting t
;         lsp-ui-doc-enable t
;         lsp-lens-enable t))
;         ;; lsp-go-gopls-server-args '("-logfile" "/tmp/gopls.log" "-rpc.trace")
;         ;; lsp-log-io t))
; (use-package lsp-treemacs
;   :init
;   (setq lsp-treemacs-sync-mode 1)
;   :commands lsp-treemacs-errors-list)

; (defun lsp-save-hook ()
;   (add-hook 'before-save-hook #'lsp-format-buffer t t))
; ;; (add-hook 'php-mode-hook #'lsp-save-hook)
; (add-hook 'lsp-ui-mode-hook #'lsp-save-hook)

; ;;; golang
; ;(use-package go-mode)
; ;  :init
; ;  (setq lsp-go-gopls-server-args '("-logfile" "/tmp/gopls.log" "-rpc.trace")))
; (defun lsp-go-install-save-hooks ()
;   ; (add-hook 'before-save-hook #'lsp-format-buffer t t)
;   (add-hook 'before-save-hook #'lsp-organize-imports t t))
; (add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

; ;;; html/js/vue
; (use-package web-mode
;   :init
;   (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
;   (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
;   :config
;   (setq web-mode-markup-indent-offset 2
;         web-mode-css-indent-offset 2
;         web-mode-code-indent-offset 2
;         web-mode-enable-current-element-highlight t
;         web-mode-enable-current-column-highlight t
;         web-mode-comment-style 2)
;   (setq-default web-mode-comment-formats
;                 '(("javascript" . "//")))
;   :hook
;   (web-mode . company-mode)
;   (web-mode . emmet-mode)
;   (web-mode . prettier-mode))
; ;; (add-hook 'web-mode-hook '(lambda ()
; ;;                             (setq tab-width 2)
; ;;                             (setq c-basic-offset 2)))

;;; java
;(use-package lsp-java)

(use-package prettier
  :config
  (global-prettier-mode))

(use-package js2-mode)
;; (use-package js2-mode
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;; (use-package vue-mode
;;   ;; :mode "\\.vue\\'"
;;   :config
;;   ;; (add-hook 'vue-mode-hook #'lsp-deferred)
;;   (setq prettier-js-args '("--parser vue"))
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode)))
;; (use-package vue-mode
;;   :hook
;;   (vue-mode . lsp-mode))

(use-package json-mode)
(use-package yaml-mode)

(use-package editorconfig
  :config
  (editorconfig-mode 1))

(provide 'init-program)
;;; init-program.el ends here
