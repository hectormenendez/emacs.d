;;; init.el --- Personal emac configuration of Héctor Menéndez

;;; Commentary:
;;; Hey, don't judge, this is a work in progresss, damn it!

;;; Code:

;; ---------------------------------------------------------------------- Helper constants


(defconst *path-elpa* (expand-file-name "_elpa" user-emacs-directory))
(defconst *path-packages* (expand-file-name "packages" user-emacs-directory))

;; ----------------------------------------------------------------------- Core settings

(setq
    ;; Core
    visible-bell t; don't make sounds, show bells.
    message-log-max 10000
    load-prefer-newer t; Don't load outdated byte code
    gc-cons-threshold 2000000; no need of garbage collect that often
    max-mini-window-height 0.5; Use up to 50% of frame height for mini-buffer window.
    ;; Startup
    inhibit-startup-screen 1; Don't show the welcome screen
    initial-scratch-message nil; Don't show a message on *scratch* mode
)

; Ask for just one letter when confirmation needed
(defalias 'yes-or-no-p 'y-or-n-p)

;; ----------------------------------------------------------------------- Package Manager

(require 'package)

(setq
    package-enable-at-startup nil; Disable the default packaage-manager at startup
    package-user-dir *path-elpa*; packages dir
)

;; The repositories to fetch packages-from.
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
;; The local packages
(add-to-list 'load-path *path-packages*)

;; This will be added no matter what, so, add it.
(package-initialize)

;; Enable the 'use-package' package manager (install it if not available)
(unless (package-installed-p 'use-package)
    (package-refresh-contents)
    (package-install 'use-package)
)
(eval-when-compile (require 'use-package))

(use-package bind-key :demand t); Allows the  use of :bind
(use-package delight :ensure t); Diminish alternative, allows to rename mode names

;; ---------------------------------------------------------------------- Packages» Native
(require 'native-simple)
(require 'native-server)
(require 'native-files)
(require 'native-recentf)
(require 'native-savehist)
(require 'native-saveplace)
(require 'native-autorevert)
(require 'native-custom)
(require 'native-mule)
(require 'native-whitespace)
(require 'native-electric)
(require 'native-paren)
(require 'native-prog-mode)
(require 'native-frame)

;; --------------------------------------------------- Packages» Editor» SystemIntegration
(require 'elpa-exec-path-from-shell)
(require 'elpa-nvm)
(require 'elpa-wakatime-mode)


;; ----------------------------------------------------------- Packages» Editor» Behaviour
(require 'elpa-try)
(require 'elpa-restart-emacs)
(require 'elpa-evil)


;; ------------------------------------------------------- Packages» Editor» ExtraFeatures
(require 'elpa-magit)


;; ---------------------------------------------------------- Packages» Editor» Navigation
(require 'elpa-ace-window)
(require 'elpa-helm)
(require 'elpa-projectile)
(require 'elpa-persp-mode)
(require 'elpa-dired+)
(require 'elpa-help+)
(require 'elpa-neotree)
;; (require 'elpa-undo-tree);; TODO: Undo tree is showing error message

;; ---------------------------------------------------------- Packages» Content» Behaviour
(require 'elpa-json-mode)
(require 'elpa-js2-mode)
(require 'elpa-rjsx-mode)
(require 'elpa-markdown-mode)
(require 'elpa-nxml-mode)

;; --------------------------------------------------------- Packages» Content» Navigation
(require 'elpa-multiple-cursors)
(require 'elpa-expand-region)


;; --------------------------------------------------------- Packages» Content» VisualAids
(require 'elpa-which-key)
(require 'elpa-telephone-line)
(require 'elpa-git-gutter)
(require 'elpa-zoom-frm)
(require 'elpa-company)
(require 'elpa-linum-relative)
;; NOTE: I'm not that sure that I still like this
;; (require 'elpa-centered-cursor-mode)


;; TODO: All of this shoud be wrapped in a prog-mode hook
;; ------------------------------------------------ Packages» ProgMode» Editor» VisualAids
(require 'elpa-flycheck)
(require 'elpa-highlight-indent-guides)
(require 'elpa-fill-column-indicator)

;; ----------------------------------------------- Packages» ProgMode» Content» Navigation
(require 'elpa-dumb-jump)
(require 'elpa-dtrt-indent)


;; ----------------------------------------------- Packages» ProgMode» Content» VisualAids
(require 'elpa-smartparens)
(require 'elpa-rainbow-delimiters)
(require 'elpa-rainbow-mode)
(require 'elpa-highlight-numbers)
(require 'elpa-highlight-quoted)
(require 'elpa-pretty-lambdada)
(require 'elpa-hl-todo)

(provide 'emacs)
;;; init.el ends here
