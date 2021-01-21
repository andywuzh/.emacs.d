(menu-bar-mode -1)

(when (display-graphic-p)
  (tool-bar-mode -1))
(scroll-bar-mode -1)

(unless window-system
  (xterm-mouse-mode 1))

(setq inhibit-startup-screen t)

;(setq gc-cons-threshold most-positive-fixnum) ; max
(setq gc-cons-threshold (* 1024 1024 100))  ; 100mb
(setq read-process-output-max (* 1024 1024)) ; 1mb

;; 不备份
(setq make-backup-files nil
      auto-save-default nil)

;;; PATH
(when *is-mac*
  (let ((mypaths (list
                  (concat (getenv "HOME") "/.pyenv/plugins/pyenv-virtualenv/shims")
                  (concat (getenv "HOME") "/.pyenv/shims")
                  ".vendor/bin"
                  (concat (getenv "HOME") "/local/bin")
                  (concat (getenv "HOME") "/go/bin")
                  "/usr/local/sbin"
                  "/usr/local/bin")))
    (setenv "PATH" (concat (mapconcat 'identity mypaths ":") ":" (getenv "PATH")))
    (setq exec-path (append mypaths (list "." exec-directory)))))

(provide 'init-startup)
;;; init-startup.el ends here
