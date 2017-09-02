;; -----------------------------------------------------------------------------
;; ivy -------------------------------------------------------------------------

;; minibuffer
(setq enable-recursive-minibuffers t)

;; ivy
(setq ivy-re-builders-alist '((swiper . regexp-quote)
                              (t . ivy--regex-fuzzy))
      ivy-initial-inputs-alist nil
      ivy-format-function #'ivy-format-function-line
      ivy-count-format ""
      ivy-extra-directories nil
      ivy-height 16)
(ivy-mode t)

;; smex
(setq smex-completion-method 'ivy
      smex-history-length (/ ivy-height 2)
      smex-save-file (concat +session-dir+ ".smex"))
(smex-initialize)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-ivy)
