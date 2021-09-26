;;; Package --- Summary
;;; Commentary:
;;; Code:

(use-package org
  :init
  ;; 绑定Org Agenda全局快捷键
  (global-set-key (kbd "C-c a") 'org-agenda)

  :config
  (setq
   ;; Org Agenda文件目录
   org-agenda-files '("~/work/notes/")
   ;; org模式下编码语法高亮
   org-src-fontify-natively t))

(provide 'init-org)
;;; init-org.el ends here
