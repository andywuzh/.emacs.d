;; -*- lexical-binding: t; -*-
;;; Package --- Summary
;;; Commentary: 运行时相关配置
;;; Code:

; 语言环境
(set-language-environment "UTF-8")
; coding
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)
;; LANG
(setenv "LANG" "zh_CN.UTF-8")
(set-locale-environment "zh_CN.utf8")

;; PATH
;; ATTENTION 已在init-misc中通过exec-path-from-shell处理，可能会影响启动速度
; (let ((custom-path (concat (getenv "HOME") "/.local/bin")))
;   (setenv "PATH" (concat custom-path path-separator (getenv "PATH")))
;   (add-to-list 'exec-path custom-path))

; 启动时不显示关于界面(about-emacs)
(setq inhibit-startup-screen t)

;;; 性能参数配置
; 垃圾回收
(setq gc-cons-threshold most-positive-fixnum) ; max
;(setq gc-cons-threshold (* 1024 1024 100))  ; 100mb
(setq read-process-output-max (* 1024 1024)) ; 1mb

;; 禁用默认备份
(setq make-backup-files nil
      auto-save-default nil)

;;; LIBRARY
;;(setenv "LIBRARY_PATH"
;;	(string-join
;;	 '("/opt/homebrew/opt/gcc/lib/gcc/current"
;;	   "/opt/homebrew/opt/libgccjit/lib/gcc/current"
;;	   "/opt/homebrew/opt/gcc/lib/gcc/current/gcc/aarch64-apple-darwin23/14")
;;	 ":"))

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

(provide 'init-runtime)
;;; init-runtime.el ends here
