;; -----------------------------------------------------------------------------
;; editing ---------------------------------------------------------------------

;; disable primary selection
(setq select-active-regions nil)

;; expand region
(setq expand-region-fast-keys-enabled nil)

;; multiple cursors
(setq mc/match-cursor-style nil
      mc/list-file (concat +session-dir+ ".mc"))

;; cua
(setq cua-keep-region-after-copy t)
(cua-mode t)

;; undo/redo
(setq undo-tree-auto-save-history t
      undo-tree-history-directory-alist `(("." . ,+backups-dir+)))
(global-undo-tree-mode t)

;; trim whitespaces
(ws-butler-global-mode t)

;; end files with a newline
(setq require-final-newline t)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-editing)
