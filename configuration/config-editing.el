;; -----------------------------------------------------------------------------
;; editing ---------------------------------------------------------------------

(setq select-active-regions nil) ; no primary selection

;; expand region
(require 'expand-region)
(setq expand-region-skip-whitespace t
      expand-region-fast-keys-enabled t
      expand-region-contract-fast-key "c"
      expand-region-reset-fast-key "r")

;; tabs
(setq-default indent-tabs-mode t
              tab-width 4)

;; cua
(require 'cua-base)
(setq cua-enable-cua-keys t
      cua-remap-control-z nil ; using undo-tree instead
      cua-keep-region-after-copy t
      cua-delete-selection t)
(cua-mode t)

;; undo/redo
(require 'undo-tree)
(setq undo-tree-enable-undo-in-region nil
      undo-tree-auto-save-history t
      undo-tree-history-directory-alist `(("." . ,+backups-dir+)))
(global-undo-tree-mode t)

;; trim whitespaces
(require 'ws-trim)
(setq         ws-trim-global-modes t)
(setq-default ws-trim-level 0)
(global-ws-trim-mode t)

(setq require-final-newline t) ; end files with a newline


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-editing)
