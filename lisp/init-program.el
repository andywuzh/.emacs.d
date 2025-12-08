;;; init-program --- 编程配置
;;; Commentary:
;;; Code:

;;; 开发通用
                                        ; tree-sitter
;; (use-package tree-sitter)
;; (use-package tree-sitter-langs
;;   :init
;;   (global-tree-sitter-mode))

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
  :init
  (setq js-indent-level 2))
(use-package yaml-mode :ensure t)
(use-package cmake-mode :ensure t)

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


(provide 'init-program)
;;; init-program.el ends here
