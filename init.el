;; -----------------------------------------------------------------------------
;; dot emacs -------------------------------------------------------------------

(defconst +emacs-dir+ (expand-file-name (if load-file-name
                                            (file-name-directory load-file-name)
                                          "~/.emacs.d/")))

(defconst +settings-dir+ (concat +emacs-dir+ "settings/"))
(defconst +packages-dir+ (concat +emacs-dir+ "packages/"))
(defconst +themes-dir+   (concat +emacs-dir+ "packages/themes/"))

(defconst +backups-dir+  (concat +emacs-dir+ "backups/"))
(defconst +session-dir+  (concat +emacs-dir+ "session/"))
(defconst +temp-dir+     (concat +emacs-dir+ "temp/"))

(defconst +auto-save-interval+ 600) ; 10 min
(defconst +documentation-delay+ 0.5)
(defconst +history-size+ 100)


;; -----------------------------------------------------------------------------
;; load path -------------------------------------------------------------------

(add-to-list 'load-path +settings-dir+)
(add-to-list 'load-path (concat +packages-dir+ "manual/"))

(let ((default-directory +settings-dir+))
  (normal-top-level-add-subdirs-to-load-path))


;; -----------------------------------------------------------------------------
;; startup ---------------------------------------------------------------------

;; disable startup screen and messages
(setq inhibit-startup-screen t
      initial-scratch-message nil)
(fset 'display-startup-echo-area-message #'ignore)

;; server
(require 'server)
(setq server-name "server"
      server-auth-dir +session-dir+)
(when (and (display-graphic-p)
           (not (server-running-p)))
  (server-start))

;; locks, temporary files, etc.
(setq create-lockfiles nil
      load-prefer-newer t
      temporary-file-directory +temp-dir+)
(fset 'yes-or-no-p #'y-or-n-p)

(set-frame-parameter nil 'fullscreen 'maximized) ; maximize frame


;; -----------------------------------------------------------------------------
;; settings --------------------------------------------------------------------

;; libs
;;(require 'cl)
(require 'subr-x)

;; language
(require 'set-language)

;; packages
(require 'set-packages)

;; settings
(require 'set-ui)
(require 'set-ivy)
(require 'set-backups)
(require 'set-session)
(require 'set-files-and-buffers)
(require 'set-editing)
(require 'set-navigation)
(require 'set-programming)
(require 'set-tools)
(require 'set-lisp)
(require 'set-key-bindings)
