;; -----------------------------------------------------------------------------
;; common lisp -----------------------------------------------------------------

;; slime
(setq inferior-lisp-program "sbcl"
      slime-compile-file-options `(:fasl-directory ,(concat +temp-dir+ "fasl/"))
      slime-load-failed-fasl 'always
      slime-startup-animation nil
      slime-repl-history-size +history-size+
      slime-repl-history-file (concat +session-dir+ ".slime"))
(slime-setup '(slime-fancy
               slime-banner
               slime-company
               slime-indentation))

;; style
(setq-mode-local lisp-mode lisp-indent-function #'common-lisp-indent-function
                           tab-width 8)


;; -----------------------------------------------------------------------------
;; emacs lisp ------------------------------------------------------------------

;; style
(setq-mode-local emacs-lisp-mode lisp-indent-function #'lisp-indent-function
                                 tab-width 8)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

;; smartparens
(sp-with-modes sp-lisp-modes
  (sp-local-pair "`" "'" :when '(sp-in-comment-p sp-in-docstring-p))
  (sp-local-pair "'" nil :actions nil))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-lisp)
