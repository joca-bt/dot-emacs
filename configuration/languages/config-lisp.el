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
               slime-presentations
               ;; editing
               slime-editing-commands
               slime-fontifying-fu
;;               slime-mdot-fu
               ;; completion
               slime-c-p-c
               slime-company
               slime-fuzzy
               ;; documentation
               slime-autodoc
               slime-hyperdoc
               ;; debugging
               slime-compiler-notes-tree
               slime-fancy-inspector
               slime-fancy-trace
               slime-references
               slime-trace-dialog
               slime-xref-browser))
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
;;(add-hook 'emacs-lisp-mode-hook 'turn-on-eldoc-mode)

;; indentation
(setq-mode-local emacs-lisp-mode lisp-indent-function 'lisp-indent-function)

;; tabs
(setq-mode-local emacs-lisp-mode indent-tabs-mode nil
                                 tab-width 8)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-lisp)
