;; -----------------------------------------------------------------------------
;; session ---------------------------------------------------------------------

;; save desktop between sessions
(require 'desktop)
(setq desktop-save t
      desktop-auto-save-timeout +auto-save-timeout+
      desktop-load-locked-desktop t
      desktop-restore-frames t
      desktop-base-file-name ".desktop"
      desktop-base-lock-name ".desktop.lock"
      desktop-dirname +session-dir+
      desktop-path `(,+session-dir+))
(desktop-save-mode t)

;; save history between sessions
(require 'savehist)
(setq history-length 100
      savehist-file (concat +session-dir+ ".history"))
(savehist-mode t)

;; save point between file visits
(require 'saveplace)
(setq save-place-limit 100
      save-place-file (concat +session-dir+ ".point"))
(setq-default save-place t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-session)
