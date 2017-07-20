;; -------------------------------------------------- -*- lexical-binding: t -*-
;; packages --------------------------------------------------------------------

(defconst +packages+ '(;; ui
                       diminish
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
                       ;; tools
                       face-explorer
                       regex-tool
                       ;; lisp
                       macrostep
                       slime
                       slime-company
                       ;; key bindings
                       hydra
                       ;; built-in
                       mode-local))

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
                         ("gnu" . "https://elpa.gnu.org/packages/"))
      package-archive-priorities '(("melpa-stable" . 20)
                                   ("melpa" . 10)
                                   ("gnu" . 0))
      package-user-dir +packages-dir+
      package-enable-at-startup nil
      package--init-file-ensured t)
(package-initialize)

;; load packages
(setq make-backup-files nil)
(mapc #'load-package +packages+)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-packages)
