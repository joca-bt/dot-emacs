;; -----------------------------------------------------------------------------
;; packages --------------------------------------------------------------------

(defconst +packages+ '(;; ui
                       diminish
                       face-explorer
                       shackle
                       tabbar
                       ;; ivy
                       flx
                       ivy
                       smex
                       ;; editing
                       expand-region
                       multiple-cursors
                       undo-tree
                       ws-butler
                       ;; navigation
                       avy
                       buffer-move
                       swiper
                       ;; programming
                       company
                       company-quickhelp
                       smartparens
                       ;; lisp
                       macrostep
                       slime
                       slime-company
                       ;; key bindings
                       hydra
                       ;; built-in
                       mode-local))

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
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("gnu" . "https://elpa.gnu.org/packages/"))
      package-archive-priorities '(("melpa-stable" . 20)
                                   ("melpa" . 10)
                                   ("gnu" . 0))
      package-user-dir +packages-dir+
      package-enable-at-startup nil)
(package-initialize)

;; load packages
(setq make-backup-files nil)
(mapc #'load-package +packages+)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-packages)
