;;; -*- lexical-binding: t -*-
;;; Package --- Summary
;;; Commentary: 加载init.el前执行
;;; Code:

(setq gc-cons-threshold most-positive-fixnum)

(setq native-comp-deferred-compilation nil
      native-comp-jit-compilation nil
      inhibit-automatic-native-compilation nil)

; 启动时，禁止加载package，后续自行处理加载
(setq package-enable-at-startup nil)

(setq load-prefer-newer noninteractive)

(setq frame-inhibit-implied-resize t)
(setq disabled-command-function nil)

; 词法绑定: nil=使用旧的动态分析的lisp方言(解析器), t=使用现代的lisp方言(解析器)
; FIXME 貌似没生效，还是必须在每个.el文件第一行明确"; -*- lexical-binding: t -*-" 
(setq lexical-binding t)

(provide 'early-init)
;;; early-init.el ends here
