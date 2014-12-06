;; -----------------------------------------------------------------------------
;; dot emacs -------------------------------------------------------------------
;;
;; organization:
;;   load path, server, startup
;;   utils
;;   configurations:
;;     ido, ui
;;     backups, session
;;     files and buffers
;;     editing, spelling
;;     programming
;;     navigation
;;   programming languages and major modes:
;;     c, lisp, python
;;     shell script
;;     markdown
;;   key bindings

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

(setq temporary-file-directory +temp-dir+) ; temporary files directory

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

(setq load-prefer-newer t) ; always load the newest version of a file


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

(set-frame-parameter nil 'fullscreen 'maximized) ; maximize frame


;; -----------------------------------------------------------------------------
;; configuration ---------------------------------------------------------------

;; siscog
;;(load (expand-file-name "~/siscog/siscog"))

;; utils
(require 'config-utils)

;; configurations
(require 'config-ido)
(require 'config-ui)
(require 'config-backups)
(require 'config-session)
(require 'config-files-and-buffers)
(require 'config-editing)
(require 'config-spelling)
(require 'config-programming)
(require 'config-navigation)

;; programming languages and major modes
(require 'config-c)
(require 'config-lisp)
(require 'config-python)
(require 'config-shell-script)
(require 'config-markdown)

;; key bindings
(require 'config-key-bindings)
