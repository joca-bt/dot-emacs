;; -----------------------------------------------------------------------------
;; dot emacs -------------------------------------------------------------------
;;
;; organization:
;;   load path, startup
;;   packages, utils
;;   settings:
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

(defconst +settings-dir+     (concat +emacs-dir+ "settings/"))
(defconst +packages-dir+     (concat +emacs-dir+ "packages/"))
(defconst +themes-dir+       (concat +emacs-dir+ "packages/themes/"))

(defconst +backups-dir+      (concat +emacs-dir+ "backups/"))
(defconst +session-dir+      (concat +emacs-dir+ "session/"))
(defconst +temp-dir+         (concat +emacs-dir+ "temp/"))

(defconst +dictionaries-dir+ (concat +emacs-dir+ "dictionaries/"))

(defconst +auto-check-delay+ 2)
(defconst +auto-save-interval+ 300) ; 5 min
(defconst +documentation-delay+ 0.5)
(defconst +error-delay+ 1)
(defconst +history-size+ 100)


;; -----------------------------------------------------------------------------
;; load path -------------------------------------------------------------------

(add-to-list 'load-path +settings-dir+)
(add-to-list 'load-path (concat +packages-dir+ "manual/"))

(let ((dirs (append (directory-files +settings-dir+ t "\\w+")
                    (directory-files (concat +packages-dir+ "manual/") t "\\w+"))))
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
(when (and window-system
           (not (server-running-p)))
  (server-start))

(fset 'yes-or-no-p 'y-or-n-p) ; no more yes-or-no questions

(setq temporary-file-directory +temp-dir+) ; temporary files directory

(setq load-prefer-newer t) ; always load the newest version of a file


;; -----------------------------------------------------------------------------
;; settings --------------------------------------------------------------------

;; siscog
;;(load (expand-file-name "~/siscog/siscog"))

;; packages
(require 'set-packages)

;; utils
(require 'set-utils)

;; settings
(require 'set-ui)
(require 'set-ido)
(require 'set-backups)
(require 'set-session)
(require 'set-files-and-buffers)
(require 'set-editing)
(require 'set-spelling)
(require 'set-programming)
(require 'set-navigation)

;; programming languages and major modes
(require 'set-c)
(require 'set-lisp)
(require 'set-python)

;; key bindings
(require 'set-key-bindings)
