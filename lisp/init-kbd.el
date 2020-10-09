(when *is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))

(use-package emacs
  :bind (("M-/" . comment-line)
         ("M-?" . comment-or-uncomment-region)))


(provide 'init-kbd)
