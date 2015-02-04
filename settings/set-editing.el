;; -----------------------------------------------------------------------------
;; editing ---------------------------------------------------------------------

;; primary selection
(setq select-active-regions nil)

;; expand region
(setq expand-region-skip-whitespace t
      expand-region-fast-keys-enabled t
      expand-region-contract-fast-key "c"
      expand-region-reset-fast-key "r")

;; multiple cursors
(setq mc/list-file (concat +session-dir+ ".mc"))

;; tab
(setq tab-always-indent t
      c-tab-always-indent t)

;; cua
(setq cua-enable-cua-keys t
      cua-remap-control-z nil ; using undo-tree instead
      cua-keep-region-after-copy t
      cua-delete-selection t)
(cua-mode t)

;; undo/redo
(setq undo-tree-enable-undo-in-region nil
      undo-tree-auto-save-history t
      undo-tree-history-directory-alist `(("." . ,+backups-dir+)))
(global-undo-tree-mode t)

;; trim whitespaces
(setq         ws-trim-global-modes t)
(setq-default ws-trim-level 0)
(global-ws-trim-mode t)

;; end files with a newline
(setq require-final-newline t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-editing)
