;;; -*- lexical-binding: t -*-
;;; Package --- Summary
;;; Commentary:
;;; Code:
;;; 自定义包目录加载

(add-to-list `load-path
	         (expand-file-name (concat user-emacs-directory "lisp")))
;; 基础配置
(require 'init-const)
(require 'init-funcs)
(require 'init-runtime)
(require 'init-elpa)

;; 交互配置
(require 'init-ui)
(require 'init-kbd)

(require 'init-misc)

;; 编程
(require 'init-lsp)
(require 'init-terminal)
;;(require 'init-package)

;; 项目
(require 'init-project)


;;(require 'init-program)
;;(require 'init-org)

;; 自定义配置(.gitignore中忽略，不提交，但syncthing同步)
(when *is-linux*
  (setq custom-file (expand-file-name "custom.linux.el" user-emacs-directory)))
(when *is-mac*
  (setq custom-file (expand-file-name "custom.mac.el" user-emacs-directory)))
(when *is-windows*
  (setq custom-file (expand-file-name "custom.windows.el" user-emacs-directory)))
(when (file-exists-p custom-file)
  (load-file custom-file))

;;; init.el ends here
