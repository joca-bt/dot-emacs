;; -----------------------------------------------------------------------------
;; session ---------------------------------------------------------------------

;; save desktop between sessions
(setq desktop-save t
      desktop-auto-save-timeout +auto-save-interval+
      desktop-load-locked-desktop t
      desktop-restore-frames t
      desktop-base-file-name ".desktop"
      desktop-base-lock-name ".desktop.lock"
      desktop-dirname +session-dir+
      desktop-path `(,+session-dir+))
(desktop-save-mode t)

;; save history between sessions
(setq savehist-autosave-interval +auto-save-interval+
      history-length +history-size+
      savehist-file (concat +session-dir+ ".history"))
(savehist-mode t)

;; save point between file visits
(setq save-place-limit +history-size+
      save-place-file (concat +session-dir+ ".point"))
(setq-default save-place t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-session)
