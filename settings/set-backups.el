;; -----------------------------------------------------------------------------
;; backups ---------------------------------------------------------------------

;; backups
(setq make-backup-files t
      backup-by-copying t
      backup-directory-alist `(("." . ,+backups-dir+)))

;; disable auto-save
(setq auto-save-default nil
      auto-save-list-file-name (concat +backups-dir+ (format ".auto-save-%s" (emacs-pid))))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-backups)
