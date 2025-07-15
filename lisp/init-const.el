;;; -*- lexical-binding: t; -*-
;;; Package --- Summary 
;;; Commentary: 定义常量
;;; Code:

(defconst *is-mac* (eq system-type 'darwin))
(defconst *is-mac-arm* (and (eq system-type 'darwin) (and (string-match "arch64" system-configuration) t)))
(defconst *is-linux* (eq system-type 'gnu/linux))
(defconst *is-windows* (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)))

(provide 'init-const)
;;; init-const.el ends here
