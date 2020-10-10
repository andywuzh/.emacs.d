(menu-bar-mode -1)
(tool-bar-mode -1)
(when (display-graphic-p)
    (scroll-bar-mode -1))

(setq inhibit-startup-screen t)

(setq gc-cons-threshold most-positive-fixnum)

;; 不备份
(setq make-backup-files nil
      auto-save-default nil)

(provide 'init-startup)
