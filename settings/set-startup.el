;; -----------------------------------------------------------------------------
;; startup ---------------------------------------------------------------------

;; disable startup screen and messages
(setq inhibit-startup-screen t
      initial-scratch-message nil)
(fset 'display-startup-echo-area-message #'ignore)

;; start emacs server
(setq server-name "server"
      server-auth-dir +session-dir+)
(when (and (display-graphic-p)
           (not (server-running-p)))
  (server-start))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-startup)
