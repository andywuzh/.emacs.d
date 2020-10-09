(use-package emacs
  :config (defalias 'yes-or-no-p 'y-or-n-p))

(use-package emacs
  :init (setq-default tab-width 4
		              indent-tabs-mode nil))

;;; 显示行号
(use-package emacs
  :init
  (setq display-line-numbers-type 'relative)  ; relative=相对, visual=正常
  (global-display-line-numbers-mode t))

(provide 'init-misc)
