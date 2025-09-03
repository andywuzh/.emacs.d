;;; -*- lexical-binding: t -*-
;;; Package --- Summary
;;; Commentary: 字体配置
;;; Code:

;;; 字体
;; 'LXGW WenKai Mono', 'Source Code Pro', Menlo, Monaco, 'Courier New', 'Droid Sans Mono', 'monospace', monospace
(use-package cnfonts
  :ensure t
  :init
  (setq cnfonts-use-system-type t)
  (setq cnfonts-profiles '("program" "org-mode" "read-book"))
  :config
  (setq cnfonts-mode 1)
  :bind
  (:map global-map
        ("C--" . cnfonts-decrease-fontsize)
        ("C-=" . cnfonts-increase-fontsize)
        )
  )

;; (when (display-graphic-p)
;;   (if *is-linux*
;;   (set-face-attribute
;;    'default nil
;;    ;; :font (font-spec :name "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
;;    :font (font-spec :name "-CTDB-FuraMono Nerd Font Mono-normal-normal-normal-*-16-*-*-*-*-0-iso10646-1"
;;                     :weight 'normal
;;                     :slant 'normal
;;                     :size 9.0))
;;   (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font
;;      (frame-parameter nil 'font)
;;      charset
;;      (font-spec :name "-WQYF-文泉驿等宽微米黑-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;;                 :weight 'normal
;;                 :slant 'normal
;;                 :size 10.0))))

;;   (if *is-mac*
;;       (set-face-attribute
;;        'default nil
;;        :font (font-spec :name "-*-Monaco-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
;;                         :weight 'normal
;;                         :slant 'normal
;;                         :size 15))
;;     (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;       (set-fontset-font
;;        (frame-parameter nil 'font)
;;        charset
;;        (font-spec :name "-*-Microsoft YaHei-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
;;                   :weight 'normal
;;                   :slant 'normal
;;                   :size 18)))))


(provide 'init-font)
;;; init-font.el ends here
