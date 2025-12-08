;;; init-web --- web  -*- lexical-binding: t; -*-
;;; Commentary:
;;; Code:

(use-package js2-mode
  :ensure t)
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


(provide 'init-web)

;;; init-web.el ends here
