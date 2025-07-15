;;; Package --- Summary
;;; Commentary:
;;; Code:
;;; 加载init.el前执行

(setq gc-cons-threshold most-positive-fixnum)

(setq native-comp-deferred-compilation nil
      native-comp-jit-compilation nil
      inhibit-automatic-native-compilation nil)

; 启动时，禁止加载package，后续自行处理加载
(setq package-enable-at-startup nil)

(setq load-prefer-newer noninteractive)

(setq frame-inhibit-implied-resize t)
(setq disabled-command-function nil)

(set-language-environment "UTF-8")

; 隐藏菜单栏/工具栏/滚动条
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(when (featurep 'ns)
  (push '(ns-transparent-titlebar . t) default-frame-alist))

(setq-default mode-line-format nil)

(provide 'early-init)
;;; early-init.el ends here
