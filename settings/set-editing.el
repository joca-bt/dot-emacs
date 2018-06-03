;; -----------------------------------------------------------------------------
;; editing ---------------------------------------------------------------------

;; disable primary selection
(setq select-active-regions nil)

;; expand region
(setq expand-region-fast-keys-enabled t
      expand-region-contract-fast-key "c"
      expand-region-reset-fast-key "r")

;; multiple cursors
(setq mc/cmds-to-run-for-all '()
      mc/cmds-to-run-once '(ivy-alt-done)
      mc/list-file (concat +session-dir+ ".mc"))

;; cua
(setq cua-keep-region-after-copy t
      cua-delete-selection t)
(cua-mode t)

;; undo/redo
(setq undo-tree-enable-undo-in-region nil
      undo-tree-auto-save-history t
      undo-tree-history-directory-alist `(("." . ,+backups-dir+)))
(global-undo-tree-mode t)

;; trim whitespaces
(ws-butler-global-mode t)

;; end files with a newline
(setq require-final-newline t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-editing)
