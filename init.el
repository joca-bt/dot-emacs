;; -----------------------------------------------------------------------------
;; dot emacs -------------------------------------------------------------------

;; constants
(defconst +emacs-dir+ (expand-file-name (if load-file-name
                                            (file-name-directory load-file-name)
                                          user-emacs-directory)))

(defconst +settings-dir+ (concat +emacs-dir+ "settings/"))
(defconst +packages-dir+ (concat +emacs-dir+ "packages/"))
(defconst +themes-dir+ (concat +emacs-dir+ "packages/themes/"))

(defconst +backups-dir+ (concat +emacs-dir+ "backups/"))
(defconst +session-dir+ (concat +emacs-dir+ "session/"))

(defconst +auto-save-interval+ 600) ; 10 min
(defconst +documentation-delay+ 0.5) ; 0.5 sec
(defconst +command-history-size+ 100)
(defconst +file-history-size+ 1000)

(defconst +windows-p+ (string= system-type "windows-nt"))

;; load path
(add-to-list 'load-path +settings-dir+)
(let ((default-directory +settings-dir+))
  (normal-top-level-add-subdirs-to-load-path))

;; settings
(require 'set-packages)
(require 'set-startup)
(require 'set-ui)
(require 'set-ivy)
(require 'set-files)
(require 'set-backups)
(require 'set-session)
(require 'set-editing)
(require 'set-programming)
(require 'set-tools)
(require 'set-data)
(require 'set-lisp)
(require 'set-key-bindings)
