;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: ELPA配置
;;; Code:


(require 'package)
(setq package-archives '(("gnu"    . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("nongnu" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/nongnu/")
                         ("melpa"  . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

;;; 设置代理, 临时!
;;(setq url-proxy-services
;;      '(("http" . "127.0.0.1:33210")
;;        ("https" . "127.0.0.1:33210")))
;; (setq url-proxy-services
;;       '(("http" . "192.168.1.99:33210")
;;         ("https" . "192.168.1.99:33210")))
;;(setq url-proxy-services
;;      '(("http" . "127.0.0.1:7890")
;;        ("https" . "127.0.0.1:7890")))
;; (setq url-proxy-services
;;      '(("http" . "192.168.1.220:7897")
;;        ("https" . "192.168.1.220:7897")))
;; (setq url-proxy-services
;;       '(("http" . "127.0.0.1:7890")
;;         ("https" . "127.0.0.1:7890")))


;;; 不检查签名!
;; (setq package-check-signature nil)

;;; 设置安装路径
(setq package-user-dir (expand-file-name (concat ".cache/elpa/" (system-name) "-" system-configuration) user-emacs-directory))
;; (cond
;;  (*is-mac-arm* (setq package-user-dir (expand-filename "elpa-mac-arm" user-emacs-directory)))
;;  (*is-mac* (setq package-user-dir (expand-filename "elpa-mac" user-emacs-directory)))
;;  (t (setq package-user-dir (expand-filename "elpa" user-emacs-directory)))))
;; (when *is-mac*
;;  (setq package-user-dir (expand-filename "elpa-mac-arm" user-emacs-directory)))

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
;;; init-elpa.el ends here
