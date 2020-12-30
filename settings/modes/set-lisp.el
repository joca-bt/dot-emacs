;; -----------------------------------------------------------------------------
;; common lisp -----------------------------------------------------------------

;; slime
(setq inferior-lisp-program "sbcl"
      slime-load-failed-fasl 'always
      slime-startup-animation nil
      slime-log-events nil
      slime-repl-history-size +command-history-size+
      slime-repl-history-file (concat +session-dir+ ".slime"))
(slime-setup '(slime-fancy slime-banner slime-company slime-indentation))

;; indentation
(setq-mode-local lisp-mode lisp-indent-function #'common-lisp-indent-function)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-lisp)
