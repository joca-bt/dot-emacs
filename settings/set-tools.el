;; -----------------------------------------------------------------------------
;; tools -----------------------------------------------------------------------

;; ediff
(setq ediff-diff-options "-w"
      ediff-split-window-function #'split-window-horizontally
      ediff-merge-split-window-function #'split-window-horizontally
      ediff-window-setup-function #'ediff-setup-windows-plain)

;; man
(setq Man-notify-method 'aggressive)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-tools)
