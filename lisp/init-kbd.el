(when *is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))

(unless window-system
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

(use-package emacs
  :bind (("M-/" . comment-line)
         ("M-?" . comment-or-uncomment-region)))

(use-package drag-stuff
  :bind (("M-<up>" . drag-stuff-up)
         ("M-<down>" . drag-stuff-down)))

(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
         ("C-c j" . crux-top-join-line)
         ("C-x ," . crux-find-user-init-file)
         ("C-c d" . crux-duplicate-current-line-or-region)
         ("C-c k" . crux-smart-kill-line)))

(provide 'init-kbd)
