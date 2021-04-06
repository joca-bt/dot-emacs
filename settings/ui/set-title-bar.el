;; -----------------------------------------------------------------------------
;; title bar -------------------------------------------------------------------

(defun tb-buffer-name ()
  (if-let ((file-name (buffer-file-name)))
      (format "%s - %s"
              (file-name-nondirectory file-name)
              (abbreviate-file-name (file-name-directory file-name)))
    (buffer-name)))

(setq frame-title-format '(:eval `(,(tb-buffer-name))))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-title-bar)
