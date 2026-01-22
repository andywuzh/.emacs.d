;;; init-program --- 编程配置  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;;; 开发通用
;; tree-sitter
(use-package tree-sitter
  :ensure t
  :mode (("\\.py\\'" . python-ts-mode)
         ("\\.c\\'" . c-ts-mode)
         ("\\.cpp\\'" . c++-ts-mode)
         ("\\.ts\\'" . typescript-ts-mode)
         ("\\.tsx\\'" . tsx-ts-mode)
         ("\\.html\\'" . html-ts-mode)
         ("\\.htm\\'" . html-ts-mode)
         ("\\.css\\'" . css-ts-mode)
         ("\\.scss\\'" . css-ts-mode)
         ("\\.sass\\'" . css-ts-mode)
         ("\\.less\\'" . css-ts-mode)
         ("\\.json\\'" . json-ts-mode)
         ("\\.yml\\'" . yaml-ts-mode)
         ("\\.yaml\\'" . yaml-ts-mode)
         ("\\.toml\\'" . toml-ts-mode)
         ("\\.Dockerfile\\'" . dockerfile-ts-mode)
         ))

;; Tree-sitter 自动编译和安装
(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (c "https://github.com/tree-sitter/tree-sitter-c")
        (cpp "https://github.com/tree-sitter/tree-sitter-cpp")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (python "https://github.com/tree-sitter/tree-sitter-python" "master" "src")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; 自动安装缺失的 tree-sitter 语法
(dolist (lang '(bash c cpp css html javascript json python toml tsx typescript yaml))
  (unless (treesit-language-available-p lang)
    (treesit-install-language-grammar lang)))

;; 启用 tree-sitter
(global-tree-sitter-mode)

;; yasnippet
(use-package yasnippet
  :ensure t
  :init
  (setq yas-triggers-in-field t)
  :config
  (yas-global-mode 1))
;; yasnippet-snippets
(use-package yasnippet-snippets
  :ensure t
  :after yasnippet)

;; (use-package flycheck
;;   :init
;;   (setq flycheck-emacs-lisp-load-path 'inherit)
;;   :config
;;   (global-flycheck-mode))


;; file type
(use-package json-mode
  :ensure t
  :hook
  (json-mode . (lambda ()
                 (setq tab-width 2)
                 (setq js-indent-level 2))))
(use-package yaml-mode :ensure t)
(use-package cmake-mode :ensure t)
(use-package protobuf-mode :ensure t)

;; Makefile 模式 (Tab 缩进，显示 4 空格)
(use-package make-mode
  :ensure nil
  :hook
  (makefile-mode . (lambda ()
                     (setq indent-tabs-mode t)
                     (setq tab-width 4))))

;; 默认缩进配置 (4 空格)
(setq-default tab-width 4
              c-basic-offset 4)

;; prettier
(use-package prettier
  :ensure t
  :config
  (global-prettier-mode))

;; editorconfig
(use-package editorconfig
  :ensure t
  :config
  (editorconfig-mode 1))

;; magit
(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package git-gutter
  :ensure t
  :init
  (setq git-gutter:modified-sign "  "
        git-gutter:added-sign "++"
        git-gutter:deleted-sign "--"
        git-gutter:visual-line t
        git-gutter:hide-gutter t
        git-gutter:disabled-modes '(asm-mode image-mode))
  :config
  (set-face-background 'git-gutter:modified "purple")
  (set-face-foreground 'git-gutter:added "green")
  (set-face-foreground 'git-gutter:deleted "red")
  (global-git-gutter-mode +1)
  )

;; dockerfile
;; (use-package dockerfile-mode
;;   :ensure t)


(provide 'init-program)
;;; init-program.el ends here
