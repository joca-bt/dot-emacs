;; -----------------------------------------------------------------------------
;; startup ---------------------------------------------------------------------

;; disable startup screen and messages
(setq inhibit-startup-screen t
      initial-scratch-message nil)
(fset 'display-startup-echo-area-message #'ignore)

;; start emacs server
(setq server-name "server"
      server-auth-dir +session-dir+)
(unless (server-running-p)
  (server-start))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-startup)
