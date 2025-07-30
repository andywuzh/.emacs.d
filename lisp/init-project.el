;; -*- lexical-binding: t; -*-

;;; Package init-project --- 编程配置
;;; Commentary:
;;; Code:

;;; 开发通用

(use-package editorconfig
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

;; projection
;; (use-package projection
;;   :ensure t
;;   ;; Enable the `projection-hook' feature.
;;   :hook (after-init . global-projection-hook-mode)

;;   ;; Require projections immediately after project.el.
;;   :config
;;   (with-eval-after-load 'project
;;     (require 'projection))

;;   :config
;;   ;; Uncomment if you want to disable prompts for compile commands customized in .dir-locals.el
;;   ;; (put 'projection-commands-configure-project 'safe-local-variable #'stringp)
;;   ;; (put 'projection-commands-build-project 'safe-local-variable #'stringp)
;;   ;; (put 'projection-commands-test-project 'safe-local-variable #'stringp)
;;   ;; (put 'projection-commands-run-project 'safe-local-variable #'stringp)
;;   ;; (put 'projection-commands-package-project 'safe-local-variable #'stringp)
;;   ;; (put 'projection-commands-install-project 'safe-local-variable #'stringp)

;;   ;; Access pre-configured projection commands from a keybinding of your choice.
;;   ;; Run `M-x describe-keymap projection-map` for a list of available commands.
;;   :bind-keymap
;;   ("C-x P" . projection-map))

;; (use-package projection-multi
;;   :ensure t
;;   ;; Allow interactively selecting available compilation targets from the current
;;   ;; project type.
;;   :bind (:map project-prefix-map
;;           ("RET" . projection-multi-compile)))

;; (use-package projection-multi-embark
;;   :ensure t
;;   :after embark
;;   :after projection-multi
;;   :demand t
;;   ;; Add the projection set-command bindings to `compile-multi-embark-command-map'.
;;   :config (projection-multi-embark-setup-command-map))

;; projectile
(use-package projectile
  :ensure t
  :demand t
  :init
  (setq projectile-project-search-path '("~/work/github/" "~/work/hulai/codes/" "~/work/y9/codes/" "~/work/sg/codes/")
        projectile-cleanup-known-projects nil ; 是否开启自动清理（已移除或重命名的）项目
        projectile-sort-order 'recently-active ; default/recentf/recently-active
        ;; cache
        projectile-enable-caching 'persistent ; t=仅当前emacs，'persistent=不同emacs
        projectile-auto-update-cache t
        projectile-indexing-method 'alien ; 高效索引
        ;; switch projects
        projectile-auto-discover t
        projectile-require-project-root t
        projectile-switch-project-action #'projectile-find-file ; projectile-find-file/projectile-dired/...
        ;; completion
        ;; projectile-completion-system 'ivy
        )
  :config
  (projectile-mode +1)
  (add-hook 'project-find-functions #'project-projectile)
  :bind
  (:map projectile-mode-map
        ("s-p" . projectile-command-map)
        ("C-c p" . projectile-command-map)
        )
  )

;; ;; vertico 补全
;; (use-package vertico
;;   :ensure t
;;   :custom
;;   ;; (vertico-scroll-margin 0) ;; Different scroll margin
;;   ;; (vertico-count 20) ;; Show more candidates
;;   (vertico-resize t) ;; Grow and shrink the Vertico minibuffer
;;   ;; (vertico-cycle t) ;; Enable cycling for `vertico-next/previous'
;;   :init
;;   (vertico-mode))

;; counsel 补全
(use-package counsel-projectile
  :ensure t
  :after (projectile)
  :config
  (counsel-projectile-mode t)
  )

;; company
;; (use-package company-quickhelp)
;; (use-package company
;;   :bind
;;   (:map company-active-map
;;         ("C-n" . company-select-next)
;;         ("C-p" . company-select-previous))
;;   :init
;;   (setq company-minimum-prefix-length 1
;;         company-idle-delay 0            ; setting 0 while using native-compile
;;         company-tooltip-align-annotations t
;;         company-show-numbers t
;;         ;company-tooltip-limit 20
;;         company-dabbrev-downcase nil
;;         )
;;   :hook
;;   (company-mode . company-quickhelp-mode)
;;   :config
;;   (global-company-mode t))

;; neotree 目录
;; (use-package neotree
;;   :ensure t
;;   :after nerd-icons
;;   :init
;;   (setq neo-theme 'nerd-icons) ;; arrow/icons/nerd-icons
;;   (global-set-key [f8] 'neotree-toggle)
;;   (global-set-key (kbd "C-S-e") 'neotree-toggle))

(use-package nerd-icons
  :ensure t
  :custom
  (nerd-icons-font-family "Symbols Nerd Font Mono"))

;; treemacs 目录
;; (use-package treemacs
;;   :config
;;   (setq treemacs-collapse-dirs (if treemacs-python-executable 3 0)
;;         treemacs-missing-project-action 'remove
;;         treemacs-sorting 'alphabetic-asc
;;         treemacs-follow-after-init t
;;         ;; treemacs-width 50
;;         )
;;   (treemacs-follow-mode t)
;;   (treemacs-filewatch-mode t)
;;   (treemacs-fringe-indicator-mode 'always)
;;   (treemacs-git-mode 'deferred)
;;   (define-key treemacs-mode-map (kbd "j") 'treemacs-next-line)
;;   (define-key treemacs-mode-map (kbd "k") 'treemacs-previous-line)
;;   ;; (with-eval-after-load 'winum
;;   ;;   (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
;;   :commands (treemacs-follow-mode
;;             treemacs-filewatch-mode
;;             treemacs-fringe-indicator-mode
;;             treemacs-git-mode)
;;   :bind
;;   (:map global-map
;;         ("M-0" . treemacs-select-window)
;;         ("C-x t t" . treemacs)))
;; (use-package treemacs-projectile
;;   :after treemacs projectile)
(use-package treemacs
  :ensure t
  :defer t
  :init
  (with-eval-after-load 'winum
    (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
  :config
  (progn
    (setq treemacs-collapse-dirs                   (if treemacs-python-executable 3 0)
          treemacs-deferred-git-apply-delay        0.5
          treemacs-directory-name-transformer      #'identity
          treemacs-display-in-side-window          t
          treemacs-eldoc-display                   'simple
          treemacs-file-event-delay                2000
          treemacs-file-extension-regex            treemacs-last-period-regex-value
          treemacs-file-follow-delay               0.2
          treemacs-file-name-transformer           #'identity
          treemacs-follow-after-init               t
          treemacs-expand-after-init               t
          treemacs-find-workspace-method           'find-for-file-or-pick-first
          treemacs-git-command-pipe                ""
          treemacs-goto-tag-strategy               'refetch-index
          treemacs-header-scroll-indicators        '(nil . "^^^^^^")
          treemacs-hide-dot-git-directory          t
          treemacs-indentation                     2
          treemacs-indentation-string              " "
          treemacs-indent-guide-style              "line"
          treemacs-is-never-other-window           nil
          treemacs-max-git-entries                 5000
          treemacs-missing-project-action          'ask
          treemacs-move-files-by-mouse-dragging    t
          treemacs-move-forward-on-expand          nil
          treemacs-no-png-images                   nil
          treemacs-no-delete-other-windows         t
          treemacs-project-follow-cleanup          nil
          treemacs-persist-file                    (expand-file-name ".cache/treemacs-persist" user-emacs-directory)
          treemacs-position                        'left
          treemacs-read-string-input               'from-child-frame
          treemacs-recenter-distance               0.1
          treemacs-recenter-after-file-follow      nil
          treemacs-recenter-after-tag-follow       nil
          treemacs-recenter-after-project-jump     'always
          treemacs-recenter-after-project-expand   'on-distance
          treemacs-litter-directories              '("/node_modules" "/.venv" "/.cask")
          treemacs-project-follow-into-home        nil
          treemacs-show-cursor                     nil
          treemacs-show-hidden-files               t
          treemacs-silent-filewatch                nil
          treemacs-silent-refresh                  nil
          treemacs-sorting                         'alphabetic-asc
          treemacs-select-when-already-in-treemacs 'move-back
          treemacs-space-between-root-nodes        t
          treemacs-tag-follow-cleanup              t
          treemacs-tag-follow-delay                1.5
          treemacs-text-scale                      nil
          treemacs-user-mode-line-format           nil
          treemacs-user-header-line-format         nil
          treemacs-wide-toggle-width               70
          treemacs-width                           35
          treemacs-width-increment                 1
          treemacs-width-is-initially-locked       t
          treemacs-workspace-switch-cleanup        nil)

    ;; The default width and height of the icons is 22 pixels. If you are
    ;; using a Hi-DPI display, uncomment this to double the icon size.
    ;;(treemacs-resize-icons 44)

    (treemacs-follow-mode t)
    (treemacs-filewatch-mode t)
    (treemacs-fringe-indicator-mode 'always)
    (when treemacs-python-executable
      (treemacs-git-commit-diff-mode t))

    (pcase (cons (not (null (executable-find "git")))
                 (not (null treemacs-python-executable)))
      (`(t . t)
       (treemacs-git-mode 'deferred))
      (`(t . _)
       (treemacs-git-mode 'simple)))

    (treemacs-hide-gitignored-files-mode nil)
    (treemacs-start-on-boot))

  :bind
  (:map global-map
        ("M-0"       . treemacs-select-window)
        ("C-x t +"   . treemacs-extra-wide-toggle)
        ("C-x t 1"   . treemacs-delete-other-windows)
        ("C-x t t"   . treemacs)
        ("C-x t d"   . treemacs-select-directory)
        ("C-x t B"   . treemacs-bookmark)
        ("C-x t C-t" . treemacs-find-file)
        ("C-x t M-t" . treemacs-find-tag))
  )

(use-package treemacs-projectile
  :after (treemacs projectile)
  :ensure t)

(use-package treemacs-icons-dired
  :ensure t
  :hook (dired-mode . treemacs-icons-dired-enable-once))

(use-package treemacs-magit
  :ensure t
  :after (treemacs magit))


;; (use-package flycheck
;;   :init
;;   (setq flycheck-emacs-lisp-load-path 'inherit)
;;   :config
;;   (global-flycheck-mode))


(provide 'init-project)
;;; init-project.el ends here
