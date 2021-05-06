;; -----------------------------------------------------------------------------
;; minibuffer ------------------------------------------------------------------

;; ivy
(setq ivy-re-builders-alist '((t . ivy--regex-fuzzy))
      ivy-initial-inputs-alist nil
      ivy-format-functions-alist '((t . ivy-format-function-line))
      ivy-count-format ""
      ivy-extra-directories nil
      ivy-height 16)
(ivy-mode t)

;; amx
(setq amx-backend 'ivy
      amx-show-key-bindings nil
      amx-history-length 10
      amx-save-file (concat +session-dir+ ".amx"))
(amx-mode t)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-minibuffer)
