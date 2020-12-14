;;; 自定义包目录加载
(add-to-list 'load-path
	     (expand-file-name (concat user-emacs-directory "lisp")))


(require 'init-const)
(require 'init-startup)
(require 'init-elpa)
(require 'init-package)
(require 'init-kbd)
(require 'init-misc)
(require 'init-program)

(require 'init-ui)

(when *is-linux*
  (setq custom-file (expand-file-name "custom.el" user-emacs-directory)))
(when *is-mac*
  (setq custom-file (expand-file-name "custom.mac.el" user-emacs-directory)))

(when (file-exists-p custom-file)
  (load-file custom-file))
