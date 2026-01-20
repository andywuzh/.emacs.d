;;; init-web --- web  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Vue Mode
(use-package vue-ts-mode
  :ensure nil
  :hook
  (vue-ts-mode . (lambda ()
                   (setq tab-width 2)
                   (setq js-indent-level 2)))
  (vue-ts-mode . lsp-bridge-mode)
  (vue-ts-mode . prettier-mode)
  (vue-ts-mode . emmet-mode))

;; TypeScript/TSX 模式增强
(add-hook 'typescript-ts-mode-hook #'lsp-bridge-mode)
(add-hook 'typescript-ts-mode-hook #'prettier-mode)
(add-hook 'typescript-ts-mode-hook (lambda () (setq tab-width 2) (setq js-indent-level 2)))
(add-hook 'tsx-ts-mode-hook #'lsp-bridge-mode)
(add-hook 'tsx-ts-mode-hook #'prettier-mode)
(add-hook 'tsx-ts-mode-hook (lambda () (setq tab-width 2) (setq js-indent-level 2)))

;; HTML 模式增强
(add-hook 'html-ts-mode-hook #'lsp-bridge-mode)
(add-hook 'html-ts-mode-hook #'emmet-mode)
(add-hook 'html-ts-mode-hook #'prettier-mode)
(add-hook 'html-ts-mode-hook (lambda () (setq tab-width 2) (setq sgml-basic-offset 2)))

;; CSS 模式增强
(add-hook 'css-ts-mode-hook #'lsp-bridge-mode)
(add-hook 'css-ts-mode-hook #'prettier-mode)
(add-hook 'css-ts-mode-hook (lambda () (setq tab-width 2) (setq css-indent-offset 2)))

;; JavaScript 模式
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :hook
  (js2-mode . (lambda ()
                (setq tab-width 2)
                (setq js-indent-level 2))))

;; Emmet 模式
(use-package emmet-mode
  :ensure t)

;; Web 模式 (用于 .jsx, .tsx 文件等)
(use-package web-mode
  :ensure t
  :mode (("\\.jsx\\'" . web-mode)
         ("\\.tsx\\'" . web-mode))
  :config
  (setq web-mode-script-padding 0
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t
        web-mode-comment-style 2)
  (setq-default web-mode-comment-formats
                '(("javascript" . "//")))
  :hook
  (web-mode . emmet-mode)
  (web-mode . prettier-mode))

(provide 'init-web)
;;; init-web.el ends here
