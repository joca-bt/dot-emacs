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
                       ;; navigation
                       swiper
                       ;; programming
                       company
                       company-quickhelp
                       flycheck
                       projectile
                       smartparens
                       ;; tools
                       ag
                       face-explorer
                       regex-tool
                       restclient
                       ;; data
                       json-mode
                       protobuf-mode
                       yaml-mode
                       ;; lisp
                       macrostep
                       slime
                       slime-company
                       ;; built-in
                       mode-local
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
(setq package-archives '(("melpa-stable" . "https://stable.melpa.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/"))
      package-archive-priorities '(("melpa-stable" . 20)
                                   ("melpa" . 10)
                                   ("elpa" . 0))
      package-user-dir +packages-dir+)

;; load packages
(setq load-prefer-newer t)
(package-initialize)
(mapc #'load-package +packages+)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-packages)
