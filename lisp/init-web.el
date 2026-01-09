;;; init-web --- web  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

;; (use-package typescript-ts-mode
;;   :mode (("\\.ts\\'" . typescript-ts-mode)
;;          ("\\.tsx\\'" . tsx-ts-mode)))

(use-package js2-mode
  :ensure t
  :mode "\\.js\\'")
;; (use-package js2-mode
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;; (use-package vue-mode
;;   ;; :mode "\\.vue\\'"
;;   :config
;;   ;; (add-hook 'vue-mode-hook #'lsp-deferred)
;;   (setq prettier-js-args '("--parser vue"))
;;   :init
;;   (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode)))
;; (use-package vue-mode
;;   :hook
;;   (vue-mode . lsp-mode))

;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-ts-mode))

(use-package emmet-mode
  :ensure t)

;; html/js/vue
(use-package web-mode
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.js\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))
  :config
  (setq web-mode-script-padding 0       ; <script>下不缩进
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t
        web-mode-comment-style 2)
  (setq-default web-mode-comment-formats
                '(("javascript" . "//")))
  :hook
  ;; (web-mode . company-mode)
  (web-mode . emmet-mode)
  (web-mode . prettier-mode))

(add-hook 'web-mode-hook '(lambda ()
                            ;; (setq web-mode-script-padding 0) ; <script>下不缩进
                            (setq tab-width 2)
                            (setq c-basic-offset 2)))

(provide 'init-web)

;;; init-web.el ends here
