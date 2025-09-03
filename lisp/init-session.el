;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: 会话处理
;;; Code:


;; 最近打开的文件
(use-package recentf
  :hook (after-init . recentf-mode)
  :config
  (dolist (reg '("^/ssh:"
                 "^/sudo:"
                 "~/.emacs.d/.cache/.*"
                 "recentf$"
                 ))
    (add-to-list 'recentf-exclude reg)))

(provide 'init-session)
;;; init-session.el ends here
