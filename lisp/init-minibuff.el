;;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: 配置minibuff
;;; Code:

;;; 状态栏
;; (use-package smart-mode-line
;;   :init
;;   (setq sml/no-confirm-load-theme t
;; 	    sml/theme 'respectful)
;;   (sml/setup))

(use-package doom-modeline
  :ensure t
  :init
  (doom-modeline-mode 1)
  :config
  (setq doom-modeline-icon t
        ;; doom-modeline-height 1
        ;; doom-modeline-unicode-fallback t
        doom-modeline-lsp t
        doom-modeline-lsp-icon t
        ))

;; (use-package awesome-tray
;;   :load-path "site-lisp/awesome-tray"
;;   :demand t
;;   :config
;;   (awesome-tray-mode 1)
;;   (setq awesome-tray-date-format "%m-%d %H:%M %a")
;;   (setq awesome-tray-active-modules
;;         '("anzu" "location" "git" "belong" "file-path" "mode-name" "date")))

;; 搜索
(use-package anzu
  :ensure t
  :defer nil
  :config
  (global-anzu-mode +1)
  (set-face-attribute 'anzu-mode-line nil
                      :foreground "yellow" :weight 'bold)
  (define-key isearch-mode-map [remap isearch-query-replace]  #'anzu-isearch-query-replace)
  (define-key isearch-mode-map [remap isearch-query-replace-regexp] #'anzu-isearch-query-replace-regexp)
  )

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  (vertico-resize t)
  :config
  (vertico-mode 1)
  )

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion))))
  )

(provide 'init-minibuff)
;;; init-minibuff.el ends here
