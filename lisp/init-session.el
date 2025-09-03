;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: 会话处理
;;; Code:

;; 恢复会话
;; (use-package session
;;   :init
;;   (setq session-save-file (expand-file-name ".emacs.session" (getenv "HOME")))
;;   (add-hook 'after-init-hook 'session-initialize))

(use-package easysession
  :ensure t
  :commands (easysession-switch-to
             easysession-save-as
             easysession-save-mode
             easysession-load-including-geometry)

  :custom
  ;; (easysession-mode-line-misc-info t)  ; Display the session in the modeline
  (easysession-save-interval (* 60 10))  ; Save every 10 minutes

  :init
  (add-hook 'emacs-startup-hook #'easysession-load-including-geometry 102)
  (add-hook 'emacs-startup-hook #'easysession-save-mode 103))

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
  (recentf-max-menu-items 30)
  (recentf-max-saved-items 100)
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
