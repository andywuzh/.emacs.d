;;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: customize tab
;;; Code:

;; tab
(use-package awesome-tab
  :load-path "site-lisp/awesome-tab"
  :demand
  :bind
  (:map awesome-tab-mode-map
        ("C-<tab>" . awesome-tab-forward)
        ("C-<iso-lefttab>" . awesome-tab-backward))
  :config
  (defun awesome-tab-hide-tab (x)
    (let ((name (format "%s" x)))
      (or
       ;; Hide tab if current window is not dedicated window.
       (window-dedicated-p (selected-window))

       (string-prefix-p "*Completions*" name)
       ;; (string-prefix-p "*Minibuf" name)
       (string-prefix-p "*lsp-bridge" name)

       (string-prefix-p "*sdcv" name)
       (string-prefix-p "*helm" name)
       (string-prefix-p "*flycheck" name)

       ;; Hide blacklist if emacs version < 27 (use header-line).
       (and (eq awesome-tab-display-line 'header-line)
            (or (string-prefix-p "*Compile-Log*" name)
                (string-prefix-p "*Flycheck" name)))
       )))
  (awesome-tab-mode t))



(provide 'init-tab)
;;; init-tab.el ends here
