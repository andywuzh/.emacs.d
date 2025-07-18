;;; Package --- Summary
;;; Commentary:
;;; Code:

(menu-bar-mode -1)

(when (display-graphic-p)
  (tool-bar-mode -1))
(scroll-bar-mode -1)

;; 选中文字后, 输入任意一个字符会替换选中的文字; 与其他编辑器保持一致
(delete-selection-mode 1)

(unless window-system
  (xterm-mouse-mode 1))

(setq inhibit-startup-screen t)

;(setq gc-cons-threshold most-positive-fixnum) ; max
(setq gc-cons-threshold (* 1024 1024 100))  ; 100mb
(setq read-process-output-max (* 1024 1024)) ; 1mb

;; coding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; LANG
(setenv "LANG" "zh_CN.UTF-8")
(set-locale-environment "zh_CN.UTF-8")

;; 禁用默认备份
(setq make-backup-files nil
      auto-save-default nil)

;;; LIBRARY
(setenv "LIBRARY_PATH"
	(string-join
	 '("/opt/homebrew/opt/gcc/lib/gcc/current"
	   "/opt/homebrew/opt/libgccjit/lib/gcc/current"
	   "/opt/homebrew/opt/gcc/lib/gcc/current/gcc/aarch64-apple-darwin23/14")
	 ":"))

;;; PATH
;; (when *is-mac*
;;   (let ((mypaths (list
;;                   (concat (getenv "HOME") "/.pyenv/plugins/pyenv-virtualenv/shims")
;;                   (concat (getenv "HOME") "/.pyenv/shims")
;;                   ".vendor/bin"
;;                   (concat (getenv "HOME") "/local/bin")
;;                   (concat (getenv "HOME") "/go/bin")
;;                   "/usr/local/sbin"
;;                   "/usr/local/bin")))
;;     (setenv "PATH" (concat (mapconcat 'identity mypaths ":") ":" (getenv "PATH")))
;;     (setq exec-path (append mypaths (list "." exec-directory)))))

(provide 'init-startup)
;;; init-startup.el ends here
