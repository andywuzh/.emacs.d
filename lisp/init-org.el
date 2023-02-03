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
   org-src-fontify-natively t
   ;; 以indent模式打开所有org文件
   org-startup-indented t
   ;; todo keywords
   org-todo-keywords '((sequence "未开始(t)" "进行中(a)" "延迟(d)" "|" "已完成(f)" "已取消(c)" "已转交(o)"))
   org-use-fast-todo-selection 'expert
   org-enforce-todo-dependencies t
   ))

(provide 'init-org)
;;; init-org.el ends here
