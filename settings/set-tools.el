;; -----------------------------------------------------------------------------
;; tools -----------------------------------------------------------------------

;; ag
(setq ag-highlight-search t
      ag-reuse-buffers t)

;; ediff
(setq ediff-split-window-function #'split-window-horizontally
      ediff-merge-split-window-function #'split-window-horizontally
      ediff-window-setup-function #'ediff-setup-windows-plain)

;; man
(setq Man-notify-method 'aggressive)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-tools)
