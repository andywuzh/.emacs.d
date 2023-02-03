;;; Package --- Summary
;;; Commentary:
;;; Code:

(when *is-mac*
  (setq mac-command-modifier 'meta)
  (setq mac-option-modifier 'super))

(unless window-system
  (global-set-key (kbd "<mouse-4>") 'scroll-down-line)
  (global-set-key (kbd "<mouse-5>") 'scroll-up-line))

(use-package emacs
  :bind (("M-/" . comment-line)
         ("M-?" . comment-or-uncomment-region)
         ("M-p" . ace-window)))

(use-package drag-stuff
  :bind (("M-<up>" . drag-stuff-up)
         ("M-<down>" . drag-stuff-down)))

(use-package crux
  :bind (("C-a" . crux-move-beginning-of-line)
         ("C-c j" . crux-top-join-line)
         ("C-x ," . crux-find-user-init-file)
         ("C-c d" . crux-duplicate-current-line-or-region)
         ("C-c k" . crux-smart-kill-line)))

;; (use-package multi-term
;;   :bind (("C-<escape>" . '(lambda ()
;;                              (interactive)
;;                              (multi-term-dedicated-toggle)
;;                              (next-window)))))

;; (use-package switch-window
;;   :init
;;   (setq switch-window-threshold 3)
;;   :bind (("C-x o" . switch-window)
;;          ("C-x 1" . switch-window-then-maximize)
;;          ("C-x 2" . switch-window-then-split-below)
;;          ("C-x 3" . switch-window-then-split-right)
;;          ("C-x 0" . switch-window-then-delete)

;;          ("C-x 4 d" . switch-window-then-dired)
;;          ("C-x 4 f" . switch-window-then-find-file)
;;          ("C-x 4 r" . switch-window-then-find-file-read-only)

;;          ("C-x 4 C-f" . switch-window-then-find-file)
;;          ("C-x 4 C-o" . switch-window-then-display-buffer)

;;          ("C-x 4 0" . switch-window-then-kill-buffer)))

(provide 'init-kbd)
;;; init-kbd.el ends here
