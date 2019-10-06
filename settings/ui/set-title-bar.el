;; -----------------------------------------------------------------------------
;; title bar -------------------------------------------------------------------

(defun tb-file-directory ()
  (let ((file-name (buffer-file-name)))
    (when file-name
      (format " - %s" (abbreviate-file-name (file-name-directory file-name))))))

(setq frame-title-format '(:eval `("%b" ,(tb-file-directory))))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-title-bar)
