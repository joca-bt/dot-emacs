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
                       flycheck-pos-tip
                       projectile
                       smartparens
                       ;; tools
                       ag
                       face-explorer
                       regex-tool
                       restclient
                       ;; modes
                       json-mode
                       macrostep
                       protobuf-mode
                       puppet-mode
                       slime
                       slime-company
                       yaml-mode
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
(setq package-archives '(("elpa" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/"))
      package-archive-priorities '(("melpa" . 10))
      package-pinned-packages '((company . "melpa-stable")
                                (flycheck . "melpa-stable")
                                (ivy . "melpa-stable")
                                (projectile . "melpa-stable")
                                (slime . "melpa-stable")
                                (swiper . "melpa-stable"))
      package-user-dir +packages-dir+)

;; load packages
(setq load-prefer-newer t)
(package-initialize)
(mapc #'load-package +packages+)
(require 'smartparens-config)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-packages)
