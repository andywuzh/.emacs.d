;;; Package --- Summary
;;; Commentary:
;;; Code:
;;; package配置

(require 'package)
(add-to-list 'package-archives '("melpl" . "https://melpa.org/ackages/") t)
(setq package-archives '(("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("gnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("org" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
;; (setq package-archives '(("melpa" . "http://elpa.emacs-china.org/melpa/")
;; 			 ("gnu" . "http://elpa.emacs-china.org/gnu/")
;; 			 ("org" . "http://elpa.emacs-china.org/org/")))


;;; 安装包初始化
(unless (bound-and-true-p package--initialized)
  (package-initialize))
(setq package-check-signature nil)

;;; 刷新安装包本地归档
(unless package-archive-contents
  (package-refresh-contents))

;;; 确保安装use-package
(unless (package-installed-p 'use-package)
  ; (package-refresh-contents)
  (package-install 'use-package))

;;; use-package配置
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-always-demand nil
      use-package-expand-minimally t
      use-package-verbose t)

;;; use-package初始化
(require 'use-package)

(provide 'init-elpa)
;;; init-elpa.el ends here
