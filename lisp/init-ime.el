;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: 输入法配置
;;; Code:

;; 根据使用场景(buff/minibuff/...)自动切换输入法
;; TODO 卡顿
;; (use-package sis
;;   :ensure t
;;   :config
;;   (sis-ism-lazyman-config "1" "2" 'fcitx5)
;;   (sis-global-cursor-color-mode t)
;;   (sis-global-respect-mode t)
;;   (sis-global-context-mode t)
;;   (sis-global-inline-mode t))

;; fcitx
;; (use-package rime
;;   :ensure t
;;   :init
;;   (setq rime-user-data-dir "~/.config/fcitx/rime")
;;   (setq default-input-method "rime")

;;   ;; (setq rime-show-candidate 'posframe)
;;   ;; (setq rime-posframe-properties
;;   ;;       (list :background-color "#333333"
;;   ;;             :foreground-color "#dcdccc"
;;   ;;             :font "WenQuanYi Micro Hei Mono-14"
;;   ;;             :internal-border-width 10))
;;   )

(provide 'init-ime)
;;; init-ime.el ends here
