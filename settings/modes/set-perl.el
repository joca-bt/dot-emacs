;; -----------------------------------------------------------------------------
;; perl 5 ----------------------------------------------------------------------

;; cperl
(fset 'perl-mode #'cperl-mode)

;; syntax highlighting
(setq cperl-highlight-variables-indiscriminately t
      cperl-invalid-face nil)
(set-face 'cperl-array-face '((t :inherit font-lock-variable-name-face)))
(set-face 'cperl-hash-face '((t :inherit font-lock-variable-name-face)))

;; indentation
(setq cperl-indent-level 4
      cperl-continued-statement-offset 4
      cperl-indent-parens-as-block t
      cperl-close-paren-offset -4)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-perl)
