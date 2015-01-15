;; -----------------------------------------------------------------------------
;; c, c++ ----------------------------------------------------------------------

;; style
(c-add-style "google" google-c-style)
(setq         c-default-style "google")
(setq-default c-auto-newline nil
              c-electric-flag t
              c-hungry-delete-key nil
              c-syntactic-indentation t)

;; documentation
(setq doxymacs-doxygen-style "JavaDoc")

(add-hook 'c-mode-common-hook 'doxymacs-mode t)
(add-hook 'c-mode-common-hook 'doxymacs-font-lock t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-c)
