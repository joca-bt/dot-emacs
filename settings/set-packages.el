;; -------------------------------------------------- -*- lexical-binding: t -*-
;; packages --------------------------------------------------------------------

(defconst +packages+ '(;; ui
                       diminish
                       shackle
                       tabbar
                       ;; ivy
                       amx
                       flx
                       ivy
                       ;; editing
                       expand-region
                       multiple-cursors
                       undo-tree
                       ws-butler
                       ;; programming
                       company
                       company-quickhelp
                       projectile
                       smartparens
                       ;; tools
                       restclient
                       ;; modes
                       bazel-mode
                       json-mode
                       macrostep
                       protobuf-mode
                       puppet-mode
                       yaml-mode
                       ;; built-in
                       server))

(let ((refreshed-p nil))
  (defun load-package (package)
    (unless (package-installed-p package)
      (unless refreshed-p
        (package-refresh-contents)
        (setq refreshed-p t))
      (package-install package))
    (require package)))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

;; package manager
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                         ("elpa-nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/"))
      package-archive-priorities '(("melpa" . 10))
      package-pinned-packages '((company . "melpa-stable")
                                (ivy . "melpa-stable")
                                (projectile . "melpa-stable"))
      package-user-dir +packages-dir+)

;; load packages
(package-initialize)
(mapc #'load-package +packages+)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-packages)
