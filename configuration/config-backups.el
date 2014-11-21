;; -----------------------------------------------------------------------------
;; backups ---------------------------------------------------------------------

;; backups
(setq make-backup-files t
      backup-by-copying t
      version-control 'never
      backup-directory-alist `(("." . ,+backups-dir+)))

;; auto-save
(setq auto-save-default t
      auto-save-timeout +auto-save-timeout+
      auto-save-interval 0
      delete-auto-save-files t
      auto-save-list-file-name (concat +backups-dir+ (format ".auto-save-%s" (emacs-pid)))
      auto-save-file-name-transforms `(("." ,+backups-dir+ t)))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-backups)
