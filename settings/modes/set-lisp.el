;; -----------------------------------------------------------------------------
;; common lisp -----------------------------------------------------------------

;; slime
(setq inferior-lisp-program "sbcl"
      slime-load-failed-fasl 'always
      slime-log-events nil
      slime-startup-animation nil
      slime-repl-history-size +command-history-size+
      slime-repl-history-file (concat +session-dir+ ".slime"))
(slime-setup '(slime-fancy slime-banner))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-lisp)
