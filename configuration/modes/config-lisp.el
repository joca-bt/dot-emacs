;; -----------------------------------------------------------------------------
;; common lisp -----------------------------------------------------------------

;; slime
(require 'slime-autoloads)
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

;; indentation
(setq-mode-local lisp-mode lisp-indent-function 'common-lisp-indent-function)

;; tabs
(setq-mode-local lisp-mode indent-tabs-mode nil
                           tab-width 8)


;; -----------------------------------------------------------------------------
;; emacs lisp ------------------------------------------------------------------

;; tags
(require 'elisp-slime-nav)
(elisp-slime-nav-mode t)

;; documentation
;;(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode t)

;; indentation
(setq-mode-local emacs-lisp-mode lisp-indent-function 'lisp-indent-function)

;; tabs
(setq-mode-local emacs-lisp-mode indent-tabs-mode nil
                                 tab-width 8)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-lisp)
