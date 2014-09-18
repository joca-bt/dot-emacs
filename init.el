;; -----------------------------------------------------------------------------
;; dot emacs
;;
;; organization:
;;   load path, server, startup
;;   meta and utils
;;   configurations:
;;     session, backups
;;     files and buffers
;;     display, navigation
;;     editing, spelling
;;     programming
;;   languages:
;;     c, lisp, python
;;   commands, key bindings
;;
;; the sidebar is called the 'fringe'
;; the status bar is called the 'mode line'
;; kill ring = clipboard
;; kill = cut
;; save = copy
;; yank = paste
;; region - the text that is marked (selected), starts at 'mark' and ends at 'point' (cursor location)

;;(require 'cl-lib)

(defconst +backups-dir+      (expand-file-name "~/.emacs.d/backups/"))
(defconst +dictionaries-dir+ (expand-file-name "~/.emacs.d/dictionaries/"))
(defconst +fasl-dir+         (expand-file-name "~/.emacs.d/fasl/"))
(defconst +server-dir+       (expand-file-name "~/.emacs.d/server/"))
(defconst +session-dir+      (expand-file-name "~/.emacs.d/session/"))
(defconst +themes-dir+       (expand-file-name "~/.emacs.d/packages/themes/"))

(defconst +documentation-delay+ 0.5)

(fset 'yes-or-no-p 'y-or-n-p) ; no more yes-or-no questions


;; -----------------------------------------------------------------------------
;; load path -------------------------------------------------------------------

(add-to-list 'load-path (expand-file-name "~/.emacs.d/configuration/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/configuration/languages/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/configuration/specific/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/auto-complete/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/dash/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/expand-region/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/ido/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/powerline/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/rw/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/slime/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/slime/contrib/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/smartparens/"))
(add-to-list 'load-path (expand-file-name "~/.emacs.d/packages/swbuff/"))


;; -----------------------------------------------------------------------------
;; server ----------------------------------------------------------------------

;; server
(require 'server)
(setq server-raise-frame t
      server-kill-new-buffers t
      server-auth-dir +server-dir+
      server-name (format "server-%s" (emacs-pid)))
(unless (server-running-p)
  (server-start))

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function) ; skip confirmation dialog


;; -----------------------------------------------------------------------------
;; startup ---------------------------------------------------------------------

;; skip startup screen
(setq inhibit-startup-screen t)
(setq inhibit-startup-echo-area-message "joca") ; replace with username
(setq initial-scratch-message nil)

;; maximize on startup
;;(set-frame-parameter nil 'fullscreen 'maximized)
(defun maximize-frame ()
  (interactive)
  (w32-send-sys-command #xf030)) ; f030 = 61488
(add-hook 'window-setup-hook 'maximize-frame t)


;; -----------------------------------------------------------------------------
;; configuration ---------------------------------------------------------------

;; siscog
;;(load (expand-file-name "~/siscog/siscog"))

;; meta and utils
(require 'config-utils)

;; configurations
(require 'config-session) ; session
(require 'config-backups) ; backups
(require 'config-files) ; files and buffers
(require 'config-display) ; display
(require 'config-navigation) ; navigation
(require 'config-editing) ; editing
(require 'config-spelling) ; spelling
(require 'config-programming) ; programming

;; languages
(require 'config-c) ; c
(require 'config-lisp) ; lisp
(require 'config-python) ; python

;; more configurations
(require 'config-commands) ; commands
(require 'config-key-bindings) ; key bindings
