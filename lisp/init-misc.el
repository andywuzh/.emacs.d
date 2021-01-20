(use-package emacs
  :config (defalias 'yes-or-no-p 'y-or-n-p))

(use-package emacs
  :init
  ;;; tab设置
  (setq-default tab-width 4
                indent-tabs-mode nil)
  ;;; 显示行号
  (setq display-line-numbers-type 'relative)  ; relative=相对, visual=正常
  (global-display-line-numbers-mode t)
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
                               (delete-trailing-whitespace) ; 删除行尾空格
                               ))

(provide 'init-misc)
