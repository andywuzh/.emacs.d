;; -*- lexical-binding: t; -*-

;;; Package --- Summary
;;; Commentary: UI配置
;;; Code:


;;; 隐藏菜单栏/工具栏/滚动条
(menu-bar-mode -1)
(scroll-bar-mode -1)
(when (display-graphic-p)
  (tool-bar-mode -1))
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)
(when (featurep 'ns)
  (push '(ns-transparent-titlebar . t) default-frame-alist))

(setq-default mode-line-format nil)

;; 括号匹配
;; (show-parent-mode t)
;; (setq show-parent-style 'expression)
;; (setq-face-attribute 'show-parent-match nil
;;                      :background: "yellow"
;;                      :weight 'bold)
;; (use-package paredit
;;   :hook ((lisp-mode-hook clojure-mode-hook) . paredit-mode)
;; )
;; (use-package awesome-pair
;;   :load-path "site-lisp/awesome-pair"
;;   :config
;;   (dolist (hook (list
;;                'c-mode-common-hook
;;                'c-mode-hook
;;                'c++-mode-hook
;;                'java-mode-hook
;;                'haskell-mode-hook
;;                'emacs-lisp-mode-hook
;;                'lisp-interaction-mode-hook
;;                'lisp-mode-hook
;;                'maxima-mode-hook
;;                'ielm-mode-hook
;;                'sh-mode-hook
;;                'makefile-gmake-mode-hook
;;                'php-mode-hook
;;                'python-mode-hook
;;                'js-mode-hook
;;                'go-mode-hook
;;                'qml-mode-hook
;;                'jade-mode-hook
;;                'css-mode-hook
;;                'ruby-mode-hook
;;                'coffee-mode-hook
;;                'rust-mode-hook
;;                'qmake-mode-hook
;;                'lua-mode-hook
;;                'swift-mode-hook
;;                'minibuffer-inactive-mode-hook
;;                ))
;;     (add-hook hook '(lambda () (awesome-pair-mode 1))))

;;   (define-key awesome-pair-mode-map (kbd "(") 'awesome-pair-open-round)
;;   (define-key awesome-pair-mode-map (kbd "[") 'awesome-pair-open-bracket)
;;   (define-key awesome-pair-mode-map (kbd "{") 'awesome-pair-open-curly)
;;   (define-key awesome-pair-mode-map (kbd ")") 'awesome-pair-close-round)
;;   (define-key awesome-pair-mode-map (kbd "]") 'awesome-pair-close-bracket)
;;   (define-key awesome-pair-mode-map (kbd "}") 'awesome-pair-close-curly)
;;   (define-key awesome-pair-mode-map (kbd "=") 'awesome-pair-equal)

;;   (define-key awesome-pair-mode-map (kbd "%") 'awesome-pair-match-paren)
;;   (define-key awesome-pair-mode-map (kbd "\"") 'awesome-pair-double-quote)

;;   (define-key awesome-pair-mode-map (kbd "SPC") 'awesome-pair-space)
;;   (define-key awesome-pair-mode-map (kbd "RET") 'awesome-pair-newline)

;;   (define-key awesome-pair-mode-map (kbd "M-o") 'awesome-pair-backward-delete)
;;   (define-key awesome-pair-mode-map (kbd "C-d") 'awesome-pair-forward-delete)
;;   (define-key awesome-pair-mode-map (kbd "C-k") 'awesome-pair-kill)

;;   (define-key awesome-pair-mode-map (kbd "M-\"") 'awesome-pair-wrap-double-quote)
;;   (define-key awesome-pair-mode-map (kbd "M-[") 'awesome-pair-wrap-bracket)
;;   (define-key awesome-pair-mode-map (kbd "M-{") 'awesome-pair-wrap-curly)
;;   (define-key awesome-pair-mode-map (kbd "M-(") 'awesome-pair-wrap-round)
;;   (define-key awesome-pair-mode-map (kbd "M-)") 'awesome-pair-unwrap)

;;   (define-key awesome-pair-mode-map (kbd "M-p") 'awesome-pair-jump-right)
;;   (define-key awesome-pair-mode-map (kbd "M-n") 'awesome-pair-jump-left)
;;   (define-key awesome-pair-mode-map (kbd "M-:") 'awesome-pair-jump-out-pair-and-newline)
;;   )




;;; 主题
;; (use-package zenburn-theme
;;   :init (load-theme 'zenburn t))
;; (use-package gruvbox-theme
;;   :init (load-theme 'gruvbox-dark-soft t))
;; (use-package doom-themes
;;   :init (load-theme 'doom-one t))
;;  (use-package modus-themes
;;    :init
;;    ;; Add all your customizations prior to loading the themes
;;    (setq modus-themes-italic-constructs t
;;          modus-themes-bold-constructs nil
;;          ;; modus-themes-region '(bg-only no-extend)
;;          ;; modus-themes-hl-line '(accented intense underline))
;;          )

;;    ;; Maybe define some palette overrides, such as by using our presets
;;    ;; (setq modus-themes-common-palette-overrides modus-themes-preset-overrides-intense)

;;    ;; Load the theme files before enabling a theme
;;    ;; (modus-themes-load-themes)
;;    :config
;;    ;; Load the theme of your choice:
;;    ;; (modus-themes-load-operandi) ; 亮
;;    ;; (modus-themes-load-operandi-deuteranopia) ; 亮, 色弱
;;    ;; (modus-themes-load-vivendi) ; 暗
;;    ;; (modus-themes-load-vivendi-deuteranopia) ; 暗, 色弱
;;    (load-theme 'modus-vivendi-deuteranopia :no-confirm)
;;    :bind ("<f5>" . modus-themes-toggle))
(use-package catppuccin-theme
  :init
  (load-theme 'catppuccin :no-confirm)
  (setq catppuccin-flavor 'mocha) ; latte, frappe, macchiato, mocha
  (catppuccin-reload)
  )

;;; 透明
; (set-frame-parameter (selected-frame) 'alpha '(90 . 90))

;; 全屏
;; @see https://www.emacswiki.org/emacs/EmacsForMacOS
;; On Mac platform, Emacs can't enter Mac's native full-screen mode,
;; otherwise it will cause white screen and left and right sliding
;; after the original full-screen property is also integrated when
;; `make-frame' is created.
;;
;; So set `ns-use-native-fullscreen' and `ns-use-fullscreen-animation'
;; first to prevent Emacs from using Mac's native full-screen mode.
;; Instead of switching to the separate full-screen workspace of the
;; Mac, the traditional full-screen mode, traditional full-screen
;; mode, will only be in full screen in the current workspace.
;;
;; This way to execute `make-frame' when closing the code or plugin,
;; there will be no bugs caused by the sliding of the Mac's separate
;; workspace.
;;
;; On the Mac platform, you can't use `set-frame-parameter' and
;; `fullboth' directly to set the full screen.  That would also cause
;; the Mac window manager to directly throw the Emacs window into a
;; separate workspace, thus producing the same bug for `make-frame'.
;;
;; Therefore, when starting, set Emacs to maximize the window state by
;; `set-frame-parameter' and `maximized', and then set it to full
;; screen state after 5 seconds.
;;
;; Mac will not move the Emacs window to a separate workspace, and
;; finally solve the problem that the native full-screen window on the
;; Mac platform causes the `make-frame' to slide left and right.
;; (when (and *is-mac* (display-graphic-p))
;;   (setq ns-use-native-fullscreen nil)
;;   (setq ns-use-fullscreen-animation nil)
;;   (run-at-time "5sec" nil
;;                (lambda ()
;;                  (let ((fullscreen (frame-parameter (selected-frame)
;;                                                     'fullscreen)))
;;                    ;; If emacs has in fullscreen status, maximized
;;                    ;; window first, drag from Mac's single space.
;;                    (when (memq fullscreen '(fullscreen fullboth))
;;                      (set-frame-parameter (selected-frame)
;;                                           'fullscreen 'maximized))
;;                    ;; Manipulating a frame without waiting for the
;;                    ;; fullscreen animation to complete can cause a
;;                    ;; crash, or other unexpected behavior, on macOS
;;                    ;; (bug #28496).
;;                    (sleep-for 0.5)
;;                    ;; Call `toggle-frame-fullscreen' to fullscreen emacs.
;;                    (toggle-frame-fullscreen)))))

;;; 状态栏
;; (use-package smart-mode-line
;;   :init
;;   (setq sml/no-confirm-load-theme t
;; 	    sml/theme 'respectful)
;;   (sml/setup))

;;(use-package doom-modeline
;;  :init
;;  (doom-modeline-mode 1)
;;  :config
;;  (setq doom-modeline-icon t
;;        ;;doom-modeline-height 1
;;        ;; doom-modeline-unicode-fallback t
;;        ;; doom-modeline-lsp t
;;        ))

(use-package awesome-tray
  :load-path "site-lisp/awesome-tray"
  :demand t
  :config
  (awesome-tray-mode 1)
  (setq awesome-tray-date-format "%m-%d %H:%M %a")
  (setq awesome-tray-active-modules
        '("anzu" "location" "git" "belong" "file-path" "mode-name" "date")))

;; tab
(use-package awesome-tab
  :load-path "site-lisp/awesome-tab"
  :demand
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

;; 搜索
(use-package anzu
  :defer nil
  :config
  (global-anzu-mode +1)
  (set-face-attribute 'anzu-mode-line nil
                      :foreground "yellow" :weight 'bold)
  (define-key isearch-mode-map [remap isearch-query-replace]  #'anzu-isearch-query-replace)
  (define-key isearch-mode-map [remap isearch-query-replace-regexp] #'anzu-isearch-query-replace-regexp)
  )


;;; 字体
;; (use-package cnfonts
;;   :config
;;   (setq cnfonts-mode 1
;;         cnfonts-profiles
;;         '("program" "org-mode" "read-book")))

;; (when (display-graphic-p)
;;   (if *is-linux*
;;   (set-face-attribute
;;    'default nil
;;    ;; :font (font-spec :name "-PfEd-DejaVu Sans Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
;;    :font (font-spec :name "-CTDB-FuraMono Nerd Font Mono-normal-normal-normal-*-16-*-*-*-*-0-iso10646-1"
;;                     :weight 'normal
;;                     :slant 'normal
;;                     :size 9.0))
;;   (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;     (set-fontset-font
;;      (frame-parameter nil 'font)
;;      charset
;;      (font-spec :name "-WQYF-文泉驿等宽微米黑-normal-normal-normal-*-*-*-*-*-*-0-iso10646-1"
;;                 :weight 'normal
;;                 :slant 'normal
;;                 :size 10.0))))

;;   (if *is-mac*
;;       (set-face-attribute
;;        'default nil
;;        :font (font-spec :name "-*-Monaco-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"
;;                         :weight 'normal
;;                         :slant 'normal
;;                         :size 15))
;;     (dolist (charset '(kana han symbol cjk-misc bopomofo))
;;       (set-fontset-font
;;        (frame-parameter nil 'font)
;;        charset
;;        (font-spec :name "-*-Microsoft YaHei-normal-normal-normal-*-*-*-*-*-p-0-iso10646-1"
;;                   :weight 'normal
;;                   :slant 'normal
;;                   :size 18)))))


(provide 'init-ui)
;;; init-ui.el ends here
