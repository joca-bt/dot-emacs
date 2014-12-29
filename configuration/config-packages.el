;; -----------------------------------------------------------------------------
;; packages --------------------------------------------------------------------
;;
;; patched packages:
;;   linum    - numbers the last line of the buffer
;;   swbuff-y - takes swbuff-clear-delay-ends-switching into consideration

(defconst +packages+ '(;; libs
                       async
                       dash dash-functional
                       f flx
                       ht
                       ov
                       popup
                       s
                       ;; packages
                       ace-jump-mode
                       buffer-move
                       company
                       diminish
                       elisp-slime-nav expand-region
                       flx-ido
                       ido-ubiquitous ido-vertical-mode
                       key-chord
                       multiple-cursors
                       neotree
                       paradox ;; parenface
                       region-bindings-mode
                       slime slime-company smartparens smex smooth-scrolling
                       undo-tree)
  "Packages managed by the package manager.")

(defconst +packages-2+ '(;; built-in
                         mode-local
                         ;; manually managed
                         linum
                         powerline
                         rw-hunspell rw-ispell rw-language-and-country-codes
                         swbuff-y
                         tabbar
                         ws-trim
                         ;; custom requires (from +packages+)
                         slime-autoloads smartparens-config)
  "Manually managed packages.")

(defvar *package-archives-refreshed-p* nil
  "Whether the package archives have already been refreshed in the current session.")

(defun load-package (package)
  "Loads a package, installing it first if necessary."
  (unless (package-installed-p package)
    (unless *package-archives-refreshed-p*
      (package-refresh-contents)
      (setq *package-archives-refreshed-p* t))
    (package-install package))
  (require package))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

;; package manager
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.org/packages/"))
      package-user-dir +packages-dir+
      package-enable-at-startup nil)
(package-initialize)

;; load and install packages
(setq make-backup-files nil)
(mapc 'load-package +packages+)
(mapc 'require +packages-2+)

;; package menu
(setq paradox-github-token t
      paradox-use-homepage-buttons nil
      paradox-display-star-count t
      paradox-display-download-count t
      paradox-column-width-package 25
      paradox-column-width-version 13
      paradox-column-width-status 9
      paradox-column-width-star 4
      paradox-column-width-download 4)
(paradox-enable)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-packages)
