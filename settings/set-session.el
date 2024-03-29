;; -----------------------------------------------------------------------------
;; session ---------------------------------------------------------------------

;; save desktop between sessions
(setq desktop-save t
      desktop-auto-save-timeout +auto-save-interval+
      desktop-load-locked-desktop t
      desktop-base-file-name ".desktop"
      desktop-base-lock-name ".desktop.lock"
      desktop-dirname +session-dir+
      desktop-path `(,+session-dir+))
(desktop-save-mode t)

;; save minibuffer history between sessions
(setq savehist-autosave-interval +auto-save-interval+
      history-length +command-history-size+
      savehist-file (concat +session-dir+ ".savehist"))
(savehist-mode t)

;; save place between file visits
(setq save-place-limit +file-history-size+
      save-place-file (concat +session-dir+ ".saveplace"))
(save-place-mode t)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-session)
