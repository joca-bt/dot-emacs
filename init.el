;; -----------------------------------------------------------------------------
;; dot emacs -------------------------------------------------------------------
;;
;; organization:
;;   load path, server, startup
;;   meta and utils
;;   configurations:
;;     ido
;;     session, backups
;;     files and buffers
;;     display, navigation
;;     editing, spelling
;;     programming
;;   programming languages and major modes:
;;     c, lisp, python
;;     shell script
;;     markdown
;;   key bindings
;;
;; the sidebar is called the 'fringe'
;; the status bar is called the 'mode line'
;; kill ring = clipboard
;; kill = cut
;; save = copy
;; yank = paste
;; region - the text that is marked (selected), starts at 'mark' and ends at 'point' (cursor location)

;;(require 'cl-lib)

(defconst +backups-dir+       (expand-file-name "~/.emacs.d/backups/"))
(defconst +session-dir+       (expand-file-name "~/.emacs.d/session/"))
(defconst +temp-dir+          (expand-file-name "~/.emacs.d/temp/"))

(defconst +configuration-dir+ (expand-file-name "~/.emacs.d/configuration/"))
(defconst +dictionaries-dir+  (expand-file-name "~/.emacs.d/dictionaries/"))
(defconst +packages-dir+      (expand-file-name "~/.emacs.d/packages/"))
(defconst +themes-dir+        (expand-file-name "~/.emacs.d/packages/themes/"))

(defconst +auto-check-delay+ 2)
(defconst +auto-save-interval+ 300) ; 5 min
(defconst +documentation-delay+ 0.5)
(defconst +history-size+ 100)

(fset 'yes-or-no-p 'y-or-n-p) ; no more yes-or-no questions

(setq debug-on-error t) ; debug on error


;; -----------------------------------------------------------------------------
;; load path -------------------------------------------------------------------

(add-to-list 'load-path +configuration-dir+)
(add-to-list 'load-path +packages-dir+)
(add-to-list 'load-path (concat +packages-dir+ "slime/contrib/"))

(let ((dirs (nconc (directory-files +configuration-dir+ t "\\w+")
                   (directory-files +packages-dir+ t "\\w+"))))
  (dolist (dir dirs)
    (when (file-directory-p dir)
      (add-to-list 'load-path dir))))

(setq load-prefer-newer t) ; always load newer files


;; -----------------------------------------------------------------------------
;; server ----------------------------------------------------------------------

;; server
(require 'server)
(setq server-raise-frame t
      server-kill-new-buffers t
      server-name "server"
      server-auth-dir +session-dir+)
(unless (and window-system
             (server-running-p))
  (server-start))

(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function) ; skip confirmation dialog


;; -----------------------------------------------------------------------------
;; startup ---------------------------------------------------------------------

;; skip startup screen
(setq inhibit-startup-screen t
      inhibit-startup-echo-area-message (user-login-name)
      initial-scratch-message nil)

;; maximize frame
;;(set-frame-parameter nil 'fullscreen 'maximized)
(add-hook 'window-setup-hook #'(lambda () (w32-send-sys-command #xf030)) t)


;; -----------------------------------------------------------------------------
;; configuration ---------------------------------------------------------------

;; siscog
;;(load (expand-file-name "~/siscog/siscog"))

;; meta and utils
(require 'config-utils)

;; configurations
(require 'config-ido) ; ido
(require 'config-session) ; session
(require 'config-backups) ; backups
(require 'config-files) ; files and buffers
(require 'config-display) ; display
(require 'config-navigation) ; navigation
(require 'config-editing) ; editing
(require 'config-spelling) ; spelling
(require 'config-programming) ; programming

;; programming languages and major modes
(require 'config-c) ; c
(require 'config-lisp) ; lisp
(require 'config-python) ; python
(require 'config-shell-script) ; shell script
(require 'config-markdown) ; markdown

;; key bindings
(require 'config-key-bindings)
