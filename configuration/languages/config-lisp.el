;; -----------------------------------------------------------------------------
;; common lisp -----------------------------------------------------------------

;; slime
(require 'slime)
(setq inferior-lisp-program "sbcl"
      slime-load-failed-fasl 'always
      slime-compile-file-options `(:fasl-directory ,+fasl-dir+))
(slime-setup '(;; repl
               slime-repl
               slime-banner
               slime-editing-commands
               ;; completion
               slime-c-p-c
               slime-fuzzy
               ;; documentation
               slime-autodoc
               slime-hyperdoc
               ;; debugging
               slime-fancy-inspector
               slime-fancy-trace
               slime-presentations
               slime-references
               slime-xref-browser))
(setq slime-use-autodoc-mode nil
      slime-autodoc-use-multiline-p t
      slime-autodoc-delay +documentation-delay+)

;; indentation
(setq-mode-local lisp-mode lisp-indent-function 'common-lisp-indent-function)

;; tabs
(setq-mode-local lisp-mode indent-tabs-mode nil
                           tab-width 8)


;; -----------------------------------------------------------------------------
;; emacs lisp ------------------------------------------------------------------

;; navigation
(require 'elisp-slime-nav)
(elisp-slime-nav-mode t)

;; documentation
;;(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; indentation
(setq-mode-local emacs-lisp-mode lisp-indent-function 'lisp-indent-function)

;; tabs
(setq-mode-local emacs-lisp-mode indent-tabs-mode nil
                                 tab-width 8)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-lisp)
