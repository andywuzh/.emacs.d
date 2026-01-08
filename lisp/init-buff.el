;;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: 配置buff
;;; Code:

;; (global-set-key (kbd "C-x C-b") 'ibuffer) ; 替换默认buffer-menu

;; ibuffer 简单，分组需自定义
(use-package ibuffer
  :bind (("C-x C-b" . ibuffer))
  ;; :init
  ;; (setq ibuffer-filter-group-name-face '(:inherit (font-lock-string-face bold)))
  ;; :config
  ;; (ibuffer-auto-mode 1)
  )
;;config for ibuffer-vc
;;copied from ibuffer-vc.el
;; (defun init-ibuffer-group-by-vc-and-default ()
;;   (interactive)
;;   (let* ((vc-res (ibuffer-vc-generate-filter-groups-by-vc-root))
;; 	 (new-group (append vc-res (cdr (assoc "default" ibuffer-saved-filter-groups)))))
;;     (setq ibuffer-filter-groups new-group)
;;     (let ((ibuf (get-buffer "*Ibuffer*")))
;;       (when ibuf
;;         (with-current-buffer ibuf
;;           (pop-to-buffer ibuf)
;;           (ibuffer-update nil t))))))
;; (define-key ibuffer-mode-map (kbd "/ '") 'init-ibuffer-group-by-vc-and-default)


;; bufler 默认分组，按项目/目录等
;; (use-package bufler
;;   :ensure t
;;   :bind
;;   (:map global-map
;;         ("C-c b" . bufler-switch-buffer)
;;         ("C-x C-b" . bufler-list)
;;         )
;;   )

;; perspective 分隔，独立buffer列表，自定义
;; (use-package perspective
;;   :ensure t
;;   :custom
;;   (persp-mode-prefix-key (kbd "C-c M-p"))
;;   :bind
;;   ("C-x C-b" . persp-list-buffers)
;;   ("C-x k" . persp-kill-buffer*)
;;   :init
;;   (persp-mode)
;;   )

(provide 'init-buff)
;;; init-buff.el ends here
