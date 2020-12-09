;;; package配置
(require 'package)
; (add-to-list 'package-archives '("melpl" . "https://melpa.org/ackages/") t)
(setq package-archives '(("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
			 ("gnu" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
			 ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))

;;; 安装包初始化
(unless (bound-and-true-p package--initialized)
  (package-initialize))

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
