;;; init-web --- web  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; Web 模式 (.vue, .jsx)
(use-package web-mode
  :ensure t
  :mode (("\\.vue\\'" . web-mode)
         ("\\.jsx\\'" . web-mode))
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
  (web-mode . (lambda ()
                (setq-local tab-width 2)
                (setq-local js-indent-level 2)))
  (web-mode . lsp-bridge-mode)
  (web-mode . prettier-mode)
  (web-mode . emmet-mode))

;; JavaScript 模式
(use-package js2-mode
  :ensure t
  :mode "\\.js\\'"
  :hook
  (js2-mode . (lambda ()
                (setq-local tab-width 2)
                (setq-local js-indent-level 2))))

;; TypeScript/TSX 模式增强
(dolist (mode '(typescript-ts-mode tsx-ts-mode))
  (add-hook (intern (format "%s-hook" mode))
            #'lsp-bridge-mode)
  (add-hook (intern (format "%s-hook" mode))
            #'prettier-mode)
  (add-hook (intern (format "%s-hook" mode))
            (lambda ()
              (setq-local tab-width 2)
              (setq-local js-indent-level 2))))

;; HTML 模式增强
(add-hook 'html-ts-mode-hook #'lsp-bridge-mode)
(add-hook 'html-ts-mode-hook #'emmet-mode)
(add-hook 'html-ts-mode-hook #'prettier-mode)
(add-hook 'html-ts-mode-hook (lambda ()
                                (setq-local tab-width 2)
                                (setq-local sgml-basic-offset 2)))

;; CSS 模式增强
(add-hook 'css-ts-mode-hook #'lsp-bridge-mode)
(add-hook 'css-ts-mode-hook #'prettier-mode)
(add-hook 'css-ts-mode-hook (lambda ()
                              (setq-local tab-width 2)
                              (setq-local css-indent-offset 2)))

;; Emmet 模式
(use-package emmet-mode
  :ensure t)

(provide 'init-web)
;;; init-web.el ends here
