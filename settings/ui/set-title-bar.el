;; -----------------------------------------------------------------------------
;; title bar -------------------------------------------------------------------

(defun tb-file-path ()
  (let ((file-name (buffer-file-name)))
    (when file-name
      (format " - %s" (abbreviate-file-name (file-name-directory file-name))))))

(setq frame-title-format '("%b" (:eval (tb-file-path))))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-title-bar)
