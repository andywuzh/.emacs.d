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
;(use-package cnfonts
;  :init (cnfonts-enable))
(set-face-attribute
 'default nil
 ;:font (font-spec :name "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
 :font (font-spec :name "-CTDB-FuraMono Nerd Font Mono-normal-normal-normal-*-16-*-*-*-*-0-iso10646-1"                  :weight 'normal
                  :slant 'normal
                  :size 9.0))
(dolist (charset '(kana han symbol cjk-misc bopomofo))
  (set-fontset-font
   (frame-parameter nil 'font)
   charset
   (font-spec :name "-WQYF-文泉驿等宽微米黑-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
              :weight 'normal
              :slant 'normal
              :size 10.0)))

(provide 'init-ui)
