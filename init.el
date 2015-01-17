;; -----------------------------------------------------------------------------
;; dot emacs -------------------------------------------------------------------
;;
;; organization:
;;   load path, startup
;;   packages, utils
;;   configurations:
;;     ui, ido
;;     backups, session
;;     files and buffers
;;     editing, spelling
;;     programming
;;     navigation
;;   programming languages and major modes:
;;     c, lisp, python
;;   key bindings

(defconst +emacs-dir+ (expand-file-name (or (when load-file-name
                                              (file-name-directory load-file-name))
                                            "~/.emacs.d/")))

(defconst +backups-dir+       (concat +emacs-dir+ "backups/"))
(defconst +session-dir+       (concat +emacs-dir+ "session/"))
(defconst +temp-dir+          (concat +emacs-dir+ "temp/"))

(defconst +configuration-dir+ (concat +emacs-dir+ "configuration/"))
(defconst +dictionaries-dir+  (concat +emacs-dir+ "dictionaries/"))
(defconst +packages-dir+      (concat +emacs-dir+ "packages/"))
(defconst +themes-dir+        (concat +emacs-dir+ "packages/themes/"))

(defconst +auto-check-delay+ 2)
(defconst +auto-save-interval+ 300) ; 5 min
(defconst +documentation-delay+ 0.5)
(defconst +error-delay+ 1)
(defconst +history-size+ 100)


;; -----------------------------------------------------------------------------
;; load path -------------------------------------------------------------------

(add-to-list 'load-path +configuration-dir+)
(add-to-list 'load-path +packages-dir+)

(let ((dirs (nconc (directory-files +configuration-dir+ t "\\w+")
                   (directory-files +packages-dir+ t "\\w+"))))
  (dolist (dir dirs)
    (when (file-directory-p dir)
      (add-to-list 'load-path dir))))


;; -----------------------------------------------------------------------------
;; startup ---------------------------------------------------------------------

;; skip startup screen and messages
(setq inhibit-startup-screen t
      initial-scratch-message nil)
(custom-set-variables `(inhibit-startup-echo-area-message ,(user-login-name)))

(set-frame-parameter nil 'fullscreen 'maximized) ; maximize frame

;; server
(require 'server)
(setq server-name "server"
      server-auth-dir +session-dir+)
(unless (and window-system
             (server-running-p))
  (server-start))

(fset 'yes-or-no-p 'y-or-n-p) ; no more yes-or-no questions

(setq temporary-file-directory +temp-dir+) ; temporary files directory

(setq load-prefer-newer t) ; always load the newest version of a file

(setq debug-on-error t) ; debug on error


;; -----------------------------------------------------------------------------
;; configurations --------------------------------------------------------------

;; siscog
;;(load (expand-file-name "~/siscog/siscog"))

;; packages
(require 'config-packages)

;; utils
(require 'config-utils)

;; configurations
(require 'config-ui)
(require 'config-ido)
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

;; key bindings
(require 'config-key-bindings)
