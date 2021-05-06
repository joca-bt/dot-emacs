;; -----------------------------------------------------------------------------
;; emacs -----------------------------------------------------------------------

;; constants
(defconst +emacs-dir+ (expand-file-name user-emacs-directory))

(defconst +backups-dir+ (concat +emacs-dir+ "backups/"))
(defconst +packages-dir+ (concat +emacs-dir+ "packages/"))
(defconst +session-dir+ (concat +emacs-dir+ "session/"))
(defconst +settings-dir+ (concat +emacs-dir+ "settings/"))
(defconst +themes-dir+ (concat +emacs-dir+ "packages/themes/"))

(defconst +auto-save-interval+ 60) ; 1 min
(defconst +documentation-delay+ 0.5) ; 0.5 sec
(defconst +command-history-size+ 100)
(defconst +file-history-size+ 1000)

(defconst +windows-p+ (eq system-type 'windows-nt))

;; load path
(add-to-list 'load-path +settings-dir+)
(let ((default-directory +settings-dir+))
  (normal-top-level-add-subdirs-to-load-path))

;; settings
(require 'set-packages)
(require 'set-startup)
(require 'set-ui)
(require 'set-minibuffer)
(require 'set-files)
(require 'set-backups)
(require 'set-session)
(require 'set-editing)
(require 'set-navigation)
(require 'set-programming)
(require 'set-tools)
(require 'set-perl)
(require 'set-xml)
(require 'set-key-bindings)
