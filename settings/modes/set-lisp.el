;; -----------------------------------------------------------------------------
;; common lisp -----------------------------------------------------------------

;; slime
(setq inferior-lisp-program "sbcl"
      slime-compile-file-options `(:fasl-directory ,(concat +temp-dir+ "fasl/"))
      slime-load-failed-fasl 'always
      slime-complete-symbol-function 'slime-fuzzy-complete-symbol
      slime-startup-animation nil
      slime-repl-history-size +history-size+
      slime-repl-history-file (concat +session-dir+ ".slime"))
(slime-setup '(slime-fancy
               slime-asdf
               slime-banner
               slime-company))
;;               slime-indentation
;;               slime-mdot-fu))
(slime-autodoc-unload)

;; style
(setq-mode-local lisp-mode lisp-indent-function 'common-lisp-indent-function
                           indent-tabs-mode nil
                           tab-width 8)


;; -----------------------------------------------------------------------------
;; emacs lisp ------------------------------------------------------------------

;; style
(setq-mode-local emacs-lisp-mode lisp-indent-function 'lisp-indent-function
                                 indent-tabs-mode nil
                                 tab-width 8)

;; navigation
(elisp-slime-nav-mode t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-lisp)
