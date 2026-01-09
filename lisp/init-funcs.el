;;; -*- lexical-binding: t; -*-
;;; Package --- Summary
;;; Commentary: 自定义函数
;;; Code:

(defvar my/open-with-editor-configs
  '((vscode    :command "code"   :args ("--goto") :format ":%l:%c")
    (sublime   :command "subl"   :format nil)  ; 不支持定位
    (zed       :command "zed"    :format ":%l:%c")
    (cursor    :command "cursor" :args ("--goto") :format ":%l:%c")
    (idea      :command "idea"   :format ":%l:%c")
    (webstorm  :command "webstorm" :format ":%l:%c")
    (pycharm   :command "pycharm"  :format ":%l:%c"))
  "编辑器配置表，支持快速扩展新编辑器.
   :command - 命令名称
   :format  - 定位格式，%l表示行号，%c表示列号，nil表示不支持定位
   :args    - 额外参数（可选）")

(defun my/open-with-editor (editor)
  "使用指定的 EDITOR 打开当前文件.
   支持交互式选择，也可直接调用：(my/open-with-editor 'vscode)
   支持的编辑器：vscode, sublime, zed, cursor, fleet, idea, webstorm, pycharm"
  (interactive
   (list (intern (completing-read "Open with: "
                                  (mapcar #'car my/open-with-editor-configs)
                                  nil t))))
  (unless buffer-file-name
    (error "当前缓冲区没有关联文件"))
  (let* ((config (assoc editor my/open-with-editor-configs))
         (command (plist-get (cdr config) :command))
         (format-str (plist-get (cdr config) :format))
         (extra-args (plist-get (cdr config) :args))
         (line (number-to-string (line-number-at-pos)))
         (column (number-to-string (current-column)))
         (file-arg (if format-str
                       (replace-regexp-in-string "%c" column
                       (replace-regexp-in-string "%l" line format-str))
                     ""))
         (args (if format-str
                   (cons (concat buffer-file-name file-arg) extra-args)
                 (cons buffer-file-name extra-args))))
    (apply 'call-process command nil nil nil args)))

;; 便捷的包装函数，保持简洁的调用方式
(defun open-with-vscode ()
  "Open current file with vscode."
  (interactive)
  (my/open-with-editor 'vscode))

(defun open-with-sublime ()
  "Open current file with sublime."
  (interactive)
  (my/open-with-editor 'sublime))

(defun open-with-zed ()
  "Open current file with zed."
  (interactive)
  (my/open-with-editor 'zed))

(defun open-with-cursor ()
  "Open current file with cursor."
  (interactive)
  (my/open-with-editor 'cursor))

(defun open-with-idea ()
  "Open current file with idea."
  (interactive)
  (my/open-with-editor 'idea))

(defun open-with-webstorm ()
  "Open current file with webstorm."
  (interactive)
  (my/open-with-editor 'webstorm))

(defun open-with-pycharm ()
  "Open current file with pycharm."
  (interactive)
  (my/open-with-editor 'pycharm))

(defun my/daemon-mode-p ()
         (or (and (fboundp 'server-running-p) (server-running-p)) ;检测server进程
             (and (display-graphic-p) (null (cdr (frame-list))))  ;检查是否GUI且仅一个frame
             (member "--daemon" command-line-args)))              ;检查启动参数

(defun my/graphic-env-p ()
  (or (display-graphic-p)               ; 当前frame是GUI
      (getenv "DISPLAY")))              ; DISPLAY环境变量存在(X11/Wayland)

;(defun my/graphic-env-pp ()
;  (let ((result (or (display-graphic-p) (getenv "DISPLAY"))))
;  (message "[Debug] Graphic env detected: %s" result)
;  result))

;(defun my/daemon-mode-pp ()
;  (let ((result (or (and (fboundp 'server-running-p) (server-running-p))
;                   (member "--daemon" command-line-args))))
;  (message "[Debug] Daemon mode detected: %s" result)
                                        ;  result))

(defun my/rename-file-and-buffer (new-name)
  "Renames both current buffer and file is's visting to NEW-NAME."
  (interactive "sNew name: ")
  (let ((name (buffer-name))
        (filename (buffer-file-name)))
    (if (not filename)
        (message "Buffer '%s' is not visiting a file!" name)
      (if (get-buffer new-name)
          (message "A buffer named '%s' already exists!" new-name)
        (progn
          (rename-file filename new-name t) ; renmae file on disk
          (rename-buffer new-name)          ; rename buffer
          (set-visited-file-name new-name)  ; associates buffer with new file name
          (set-buffer-modified-p nil))))))



(provide 'init-funcs)
;;; init-funcs.el ends here
