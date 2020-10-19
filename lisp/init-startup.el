(menu-bar-mode -1)
(tool-bar-mode -1)
(when (display-graphic-p)
  (scroll-bar-mode -1))

(unless window-system
  (xterm-mouse-mode 1))

(setq inhibit-startup-screen t)

(setq gc-cons-threshold most-positive-fixnum)
(setq read-process-output-max (* 1024 1024)) ; 1mb

;; 不备份
(setq make-backup-files nil
      auto-save-default nil)

(provide 'init-startup)
