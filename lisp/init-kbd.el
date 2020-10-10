(when *is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'none))

(use-package emacs
  :bind (("M-/" . comment-line)
         ("M-?" . comment-or-uncomment-region)))

(use-package drag-stuff
  :bind (("M-<up>" . drag-stuff-up)
         ("M-<down>" . drag-stuff-down)))

(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
         ("C-c ^" . crux-top-join-line)
         ("C-x ," . crux-find-user-init-file)
         ("C-S-d" . crux-duplicate-current-line-or-region)
         ("C-S-k" . crux-smart-kill-line)))

(provide 'init-kbd)
