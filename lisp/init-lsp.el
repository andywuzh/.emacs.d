;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: LSP配置
;;; Code:

(add-to-list 'load-path (expand-file-name "site-lisp/lsp-bridge" user-emacs-directory))

;; (use-package posframe)

; yasnippet
(use-package yasnippet
  :config
  (yas-global-mode 1))

(use-package markdown-mode
  :ensure t
  :mode ("README\\.md\\'" . gfm-mode)
  :init (setq markdown-command "multimarkdown")
  :bind (:map markdown-mode-map
              ("C-c C-e" . markdown-do)))

(require 'lsp-bridge)
;; lsp-bridge basic config
;; (setq lsp-bridge-enable-debug t) 	; 测试
(setq lsp-bridge-log-level 'debug) 	; 日志等级
;; (setq lsp-bridge-user-langserver-dir (expand-file-name "lisp/lsp/langserver" user-emacs-directory))
;; (setq lsp-bridge-user-multiserver-dir (expand-file-name "lisp/lsp/multierver" user-emacs-directory))

; ATTENTION lsp-bridge本身使用的python配置, 两种方式
; 1. 使用uv
;   - 软链接site-lisp/lsp-bridge/python-lsp-bridge到某个$PATH下，比如~/.local/bin/python-lsp-bridge
;   - cd site-list/lsp-bridge && uv venv -p 3.13 # venv版本尽量与lsp-bridge/pyproject.toml配置兼容
; 2. 指定python路径，可使用pyenv
; (setq lsp-bridge-python-command "~/.pyenv/versions/3.12.4/bin/python3")

;; lsp-bridge remote config
;(setq lsp-bridge-enable-with-tramp t)
;(setq lsp-bridge-remote-start-automatically t)
;(setq lsp-bridge-remote-python-command "/usr/bin/python3")
;(setq lsp-bridge-remote-python-file "/root/lsp-bridge/lsp-bridge.py")
;(setq lsp-bridge-remote-log "/var/log/lsp-bridge/lsp-bridge.log")

;; 保存时格式化
;; (add-hook 'before-save-hook #'lsp-bridge-code-format)
;; (setq lsp-bridge-enable-auto-format-code t)
;; (setq lsp-bridge-auto-format-code-idle 30)
(setq lsp-bridge-find-def-select-in-open-windows t)

;; 快捷键
(define-key lsp-bridge-mode-map (kbd "C-c l r") #'lsp-bridge-rename)
(define-key lsp-bridge-mode-map (kbd "C-c l a") #'lsp-bridge-code-action)
(define-key lsp-bridge-mode-map (kbd "C-c l f") #'lsp-bridge-code-format)
(define-key lsp-bridge-mode-map (kbd "M-]") #'lsp-bridge-find-def)
(define-key lsp-bridge-mode-map (kbd "M-[") #'lsp-bridge-find-def-return)
(define-key lsp-bridge-mode-map (kbd "C-M-]") #'lsp-bridge-find-references)

;; 交互体验
(setq lsp-bridge-enable-diagnostics t)
(setq acm-enable-tabnine nil)		; 禁用默认开启的tabnine补全

(global-lsp-bridge-mode)


;;; language server
;; python
(setq lsp-bridge-python-lsp-server "jedi")
(setq lsp-bridge-python-multi-lsp-server "jedi_ruff")
;; (setq lsp-bridge-python-lsp-server "basedpyright")
;; (setq lsp-bridge-python-multi-lsp-server "basedpyright_ruff")

;; (require 'json)
;; (defun local/lsp-bridge-get-single-lang-server-by-project (project-path filepath)
;;   (message "[DEBUG] replace get single lang server")
;;   (message (format "project-path: %s, filepath: %s" project-path filepath))
;;   (let* ((json-object-type 'plist)
;;          (custom-dir (expand-file-name ".cache/lsp-bridge/langserver" user-emacs-directory))
;;          (custom-config (expand-file-name (concat lsp-bridge-python-lsp-server ".json") custom-dir))
;;          (default-config (json-read-file (expand-file-name
;;                                           (concat "site-lisp/lsp-bridge/langserver/" lsp-bridge-python-lsp-server ".json")
;;                                           user-emacs-directory)))
;;          (settings (plist-get default-config :settings))
;;          )

;;     (message (format "custom-config: %s" custom-config))

;;     (plist-put settings :pythonPath (expand-file-name ".venv/bin/python3" project-path))
;;     (plist-put settings :venvPath (expand-file-name ".venv" project-path))

;;     (make-directory (file-name-directory custom-config) t)

;;     (with-temp-file custom-config
;;       (insert (json-encode default-config)))

;;     custom-config))

;; (defun local/lsp-bridge-get-multi-lang-server-by-project (project-path filepath)
;;   (message "[DEBUG] replace get multi lang server")
;;   (message (format "project-path: %s, filepath: %s" project-path filepath))

;;   (local/lsp-bridge-get-single-lang-server-by-project project-path filepath)

;;   (let* ((json-object-type 'plist)
;;          (custom-dir (expand-file-name ".cache/lsp-bridge/multiserver" user-emacs-directory))
;;          (custom-config (expand-file-name (concat lsp-bridge-python-multi-lsp-server ".json") custom-dir))
;;          (default-config (json-read-file (expand-file-name
;;                                           (concat "site-lisp/lsp-bridge/multiserver/" lsp-bridge-python-multi-lsp-server ".json")
;;                                           user-emacs-directory)))
;;          )

;;     (message (format "custom-config: %s" custom-config))

;;     (make-directory (file-name-directory custom-config) t)

;;     (with-temp-file custom-config
;;       (insert (json-encode default-config)))

;;     custom-config))


;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (setq-local
;;              lsp-bridge-get-single-lang-server-by-project
;;              'local/lsp-bridge-get-single-lang-server-by-project)
;;             (setq-local
;;              lsp-bridge-get-multi-lang-server-by-project
;;              'local/lsp-bridge-get-multi-lang-server-by-project)))


(require 'json)

(defun local/lsp-bridge-get-single-lang-server-by-project (project-path filepath)
  (let* ((json-object-type 'plist)
         (custom-dir (expand-file-name ".cache/lsp-bridge/langserver" user-emacs-directory))
         (default-config-file (expand-file-name (concat "site-lisp/lsp-bridge/langserver/" lsp-bridge-python-lsp-server ".json") user-emacs-directory))
         ;; 动态生成项目专属配置文件名
         (project-hash (md5 project-path))
         (custom-config (expand-file-name (format (concat lsp-bridge-python-lsp-server "-%s.json") project-hash) custom-dir))
         ;; 1. 读取默认配置
         ;; (default-content (when (file-exists-p default-config-file)
         ;;                   (with-temp-buffer
         ;;                     (insert-file-contents default-config-file)
         ;;                     (json-read-from-string (buffer-string)))))
         ;; (default-content (when (file-exists-p default-config-file)
         ;;                    (with-temp-buffer
         ;;                      (let ((coding-system-for-read 'utf-8)) ; 强制 UTF-8 编码
         ;;                        (insert-file-contents default-config-file))
         ;;                      ;; 诊断输出原始内容（调试后移除）
         ;;                      (message "Config content: %s" (buffer-string))
         ;;                      ;; 健壮性解析
         ;;                      (condition-case err
         ;;                          (json-read-from-string
         ;;                           (buffer-substring-no-properties (point-min) (point-max)))
         ;;                        (error
         ;;                         (message "JSON parse error: %S" err)
         ;;                         nil))))) ; 返回 nil 避免后续错误
         (default-content (json-read-file default-config-file))
         ;; 2. 动态获取 venv 路径
         (venv-dir (expand-file-name ".venv" project-path))
         (python-path (when (file-directory-p venv-dir)
                        (expand-file-name "bin/python" venv-dir)))
         )
    ;; (message "aaaaa")
    (message (format "check default-content: %s" (plist-get default-content :name)))
    ;; (message "bbbbb")

    (message (format "1. custom-config: %s" custom-config))
    (message (format "1. default-config: %s" default-config-file))
    (message (format "1. venv-dir: %s" venv-dir))
    (message (format "1. python-path: %s" python-path))
    (message "xxxxx")
    (message (format "check default-content: %s" (type-of default-content)))

    (message "yyyyy")
    ;; 确保配置目录存在
    (make-directory custom-dir t)

    ;; 3. 更新配置
    ;; (message (format "check default-content: %s" default-content))
    (message (format "check python-path: %s" python-path))

    (when (and default-content python-path)
      ;; (message (format "check default-content: %s" default-content))
      (message (format "check python-path: %s" python-path))
      ;; basedpright
      ;; (let ((settings (plist-get default-content :settings)))
      ;;   ;; 更新 Python 路径
      ;;   (plist-put settings :pythonPath python-path)
      ;;   (plist-put settings :venvPath venv-dir)

      ;;   ;; 写回项目专属配置文件
      ;;   (with-temp-file custom-config
      ;;     (insert (json-encode default-content)))))

      ;; jedi
      (setq default-content
            (plist-put default-content :initializationOptions
                       (list :workspace `(:environmentPath ,python-path))))
      ;; 写回项目专属配置文件
      (with-temp-file custom-config
        (insert (json-encode default-content))))


      ;; (let ((settings (plist-get default-content :settings)))
      ;;   ;; 更新 Python 路径
      ;;   (plist-put default-content :pythonPath python-path)
      ;;   (plist-put default-content :venvPath venv-dir)

      ;;   ;; 写回项目专属配置文件
      ;;   (with-temp-file custom-config
      ;;     (insert (json-encode default-content)))))

    ;; 4. 返回项目专属配置路径
    (if (file-exists-p custom-config)
        custom-config
      default-config-file))) ; 降级方案：返回默认配置

;; (require 'subr-x)
(defun local/lsp-bridge-get-multi-lang-server-by-project (project-path filepath)
  ;; TODO improve
  ;; 处理语言配置
  (message "wrap single lang server")
  (local/lsp-bridge-get-single-lang-server-by-project project-path filepath)

  ;; 处理多配置
  (message "wrap multi lang server")
  (let* ((json-object-type 'plist)
         (custom-dir (expand-file-name ".cache/lsp-bridge/multiserver" user-emacs-directory))
         (default-config-file (expand-file-name (concat "site-lisp/lsp-bridge/multiserver/" lsp-bridge-python-multi-lsp-server ".json") user-emacs-directory))
         (project-hash (md5 project-path))
         (custom-config (expand-file-name (format (concat lsp-bridge-python-multi-lsp-server "-%s.json") project-hash) custom-dir))
         ;; 读取默认配置
         (default-content (when (file-exists-p default-config-file)
                            (with-temp-buffer
                              (insert-file-contents default-config-file)
                              (json-read-from-string (buffer-string)))))
         )

    (message (format "default config file: %s" default-config-file))
    (message (format "custom config file: %s" custom-config))

    ;; 确保配置目录存在
    (make-directory custom-dir t)

    ;; 写回项目专属配置文件
    (with-temp-file custom-config
      (insert (json-encode default-content)))

    ;; 返回专属配置文件路径
    (if (file-exists-p custom-config)
        custom-config
      default-config-file)))

(add-hook 'python-mode-hook
          (lambda ()
            (setq-local lsp-bridge-get-single-lang-server-by-project
                        'local/lsp-bridge-get-single-lang-server-by-project)
            (setq-local lsp-bridge-get-multi-lang-server-by-project
                        'local/lsp-bridge-get-multi-lang-server-by-project)
            ))

;; json
(use-package json-mode
  :init
  (setq js-indent-level 2))



(provide 'init-lsp)
;;; init-lsp.el ends here
