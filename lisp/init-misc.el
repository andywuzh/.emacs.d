;;; Package --- Summary
;;; Commentary:
;;; Code:
(use-package emacs
  :config (defalias 'yes-or-no-p 'y-or-n-p))

(use-package emacs
  :init
  ;;; tab设置
  (setq-default tab-width 4
                indent-tabs-mode nil)
  ;; 高亮当前行
  (global-hl-line-mode 1)
  ;;; 显示行号
  (setq display-line-numbers-type 'relative)  ; relative=相对, visual=正常
  (global-display-line-numbers-mode t)
  ;;; 显示时间
  (setq display-time-day-and-date t)
  (setq display-time-format "%Y-%m-%d %I:%M%p")
  (display-time-mode t)
  ;;; 内置的高亮匹配括号
  (show-paren-mode 1)
  ;;; 自动补齐括号等
  (electric-pair-mode 1)
  (setq electric-pair-pairs '((?\" . ?\")
                              (?\' . ?\')
                              (?\{ . ?\})
                              (?\( . ?\))
                              (?\[ . ?\]))))

;;; 高亮匹配括号
(use-package highlight-parentheses
  :init
  (highlight-parentheses-mode t)
  (global-highlight-parentheses-mode t))

;;; 保存文件时删除行尾空格
(add-hook 'before-save-hook '(lambda()
                               (delete-trailing-whitespace))) ; 删除行尾空格

;;; 修复dired在mac系统中无法打开目录的问题
(if (and *is-mac* (file-exists-p "/usr/local/bin/gls"))
    (setq dired-use-ls-dired t
          insert-directory-program "/usr/local/bin/gls"
          dired-listing-switches "-aBhl --group-directories-first")
  (setq dired-use-ls-dired nil))

;;; 有道字典
(use-package youdao-dictionary
  :commands youdao-dictionary-play-voice-of-current-word
  :bind (("C-c y" . youdao-dictionary-search-at-point-tooltip))
  :init
  (setq url-automatic-caching t
        youdao-dictionary-use-chinese-word-segmentation t)) ;中文分词

;;; 自动转换文件换行符
(defun auto-convert-newline ()
  (let ((coding-str (symbol-name buffer-file-coding-system)))
    (when (string-match "-\\(?:doc\\|mac\\)$" coding-str)
      (set-buffer-file-coding-system 'unix))))
(add-hook 'find-file-hook 'auto-convert-newline)

(provide 'init-misc)
;;; init-misc.el ends here
