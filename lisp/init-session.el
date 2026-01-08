;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: 会话处理
;;; Code:

;; 恢复会话
;; (use-package session
;;   :init
;;   (setq session-save-file (expand-file-name ".emacs.session" (getenv "HOME")))
;;   (add-hook 'after-init-hook 'session-initialize))

;; 会话管理
;; easysession
;; (use-package easysession
;;   :ensure t
;;   :commands (easysession-switch-to
;;              easysession-save-as
;;              easysession-save-mode
;;              easysession-load-including-geometry)
;;
;;   :custom
;;   ;; (easysession-mode-line-misc-info t)  ; Display the session in the modeline
;;   (easysession-save-interval (* 60 10))  ; Save every 10 minutes
;;
;;   :init
;;   (add-hook 'emacs-startup-hook #'easysession-load-including-geometry 102)
;;   (add-hook 'emacs-startup-hook #'easysession-save-mode 103))

;; perspective
;; (use-package perspective
;;   :ensure t
;;   :custom
;;   (persp-state-default-file (expand-file-name ".cache/perspective" user-emacs-directory))
;;   ;; :config
;;   ;; 启动时自动恢复会话
;;   ;; (add-hook 'after-init-hook #'persp-state-load)
;;   ;; 定时自动保存会话（每5分钟）
;;   ;; (run-with-idle-timer 300 t #'persp-state-save)
;;   ;; 退出时自动保存会话
;;   ;; (add-hook 'kill-emacs-hook #'persp-state-save)
;;   )

;; 操作历史
(use-package savehist
  :ensure nil
  :hook
  (after-init . savehist-mode)
  :config
  (add-to-list 'savehist-additional-variables 'kill-ring)
  (add-to-list 'savehist-additional-variables 'mark-ring)
  (add-to-list 'savehist-additional-variables 'search-ring)
  (add-to-list 'savehist-additional-variables 'regexp-search-ring)
  )

;; 最近打开的文件
(use-package recentf
  :ensure t
  :custom
  (recentf-max-menu-items 15)
  (recentf-max-saved-items 500)
  (recentf-auto-cleanup 'never)
  :config
  (dolist (reg '("^/ssh:"
                 "^/sudo:"
                 "~/.emacs.d/.cache/.*"
                 "^~/.emacs.d/session."
                 "recentf$"
                 ))
    (add-to-list 'recentf-exclude reg))
  :hook (after-init . recentf-mode)
  )


(provide 'init-session)
;;; init-session.el ends here
