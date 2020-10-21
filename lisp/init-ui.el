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

;;; 字体
(use-package cnfonts
  :init (cnfonts-enable))

(provide 'init-ui)
