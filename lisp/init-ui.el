;;; 主题
(use-package zenburn-theme
  :init (load-theme 'zenburn t))
;; (use-package gruvbox-theme
;;   :init (load-theme 'gruvbox-dark-soft t))
;; (use-package doom-themes
 ;; :init (load-theme 'doom-one t))

;;; 状态栏
(use-package smart-mode-line
  :init
  (setq sml/no-confirm-load-theme t
	    sml/theme 'respectful)
  (sml/setup))

(provide 'init-ui)
