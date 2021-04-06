;; -----------------------------------------------------------------------------
;; startup ---------------------------------------------------------------------

;; disable startup screen and messages
(setq inhibit-startup-screen t
      initial-scratch-message nil)
(fset 'display-startup-echo-area-message #'ignore)

;; create directories
(unless (file-exists-p +backups-dir+)
  (make-directory +backups-dir+))
(unless (file-exists-p +session-dir+)
  (make-directory +session-dir+))

;; start emacs server
(setq server-name "server"
      server-auth-dir +session-dir+)
(unless (server-running-p)
  (server-start))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-startup)
