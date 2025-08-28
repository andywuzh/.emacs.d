;; -*- lexical-binding: t -*-

;;; Package --- Summary
;;; Commentary: EAF
;;; Code:

(setq my/eaf-path "site-lisp/emacs-application-framework")
(use-package eaf
  :load-path my/eaf-path
  :init
  (setq eaf-python-command (expand-file-name (file-name-concat my/eaf-path ".venv/bin/python3") user-emacs-directory))
  :custom
  (eaf-browser-continue-where-left-off t)
  ;; (eaf-browser-enable-adblocker t)
  ;; (browse-url-browser-function 'eaf-open-browser)
  ;; :config
  ;; (defalias 'browse-web #'eaf-open-browser)
  ;; (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  ;; (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  ;; (eaf-bind-key nil "M-q" eaf-browser-keybinding) ;; unbind, see more in the Wiki
  )

;; eaf-browser eaf-image-viewer eaf-terminal eaf-file-manager eaf-mindmap eaf-mind-elixir eaf-markmap eaf-pyqterminal
(dolist (app '(eaf-browser eaf-mindmap eaf-mind-elixir eaf-markmap))
  (eval `(use-package ,app
    :ensure nil
    :after eaf
    :defer t)))

(use-package eaf-file-manager
  :ensure nil
  :after eaf
  :init
  (setq eaf-dired-advisor-enable nil))

;; (use-package eaf-browser
;;   :ensure nil
;;   :after eaf)
;; (use-package eaf-image-viewer
;;   :ensure nil
;;   :after eaf)
;; (use-package eaf-terminal
;;   :ensure nil
;;   :after eaf)


(provide 'init-eaf)
;;; init-eaf.el ends here
