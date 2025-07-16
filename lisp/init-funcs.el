;;; -*- lexical-binding: t; -*-
;;; Package --- Summary
;;; Commentary: 自定义函数
;;; Code:


(defun open-with-vscode()
  "Open current file with vscode."
  (interactive)
  (let ((line (number-to-string (line-number-at-pos)))
        (column (number-to-string (current-column))))
    (apply 'call-process "code" nil nil nil (list (concat buffer-file-name ":" line ":" column) "--goto"))))

(defun open-with-sublime()
  "Open current file with sublime."
  (interactive)
  (let ((line (number-to-string (line-number-at-pos)))
        (column (number-to-string (current-column))))
    (apply 'call-process "subl" nil nil nil (list buffer-file-name))))

(defun custom/daemon-mode-p ()
         (or (and (fboundp 'server-running-p) (server-running-p)) ;检测server进程
             (and (display-graphic-p) (null (cdr (frame-list))))  ;检查是否GUI且仅一个frame
             (member "--daemon" command-line-args)))              ;检查启动参数

(defun custom/graphic-env-p ()
  (or (display-graphic-p)               ; 当前frame是GUI
      (getenv "DISPLAY")))              ; DISPLAY环境变量存在(X11/Wayland)

;(defun custom/graphic-env-pp ()
;  (let ((result (or (display-graphic-p) (getenv "DISPLAY"))))
;  (message "[Debug] Graphic env detected: %s" result)
;  result))

;(defun custom/daemon-mode-pp ()
;  (let ((result (or (and (fboundp 'server-running-p) (server-running-p))
;                   (member "--daemon" command-line-args))))
;  (message "[Debug] Daemon mode detected: %s" result)
;  result))



(provide 'init-funcs)
;;; init-funcs.el ends here
