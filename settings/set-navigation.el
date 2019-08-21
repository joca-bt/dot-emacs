;; -----------------------------------------------------------------------------
;; navigation ------------------------------------------------------------------

(defun transpose-windows ()
  (interactive)
  (let* ((window1 (selected-window))
         (window2 (next-window window1))
         (buffer (window-buffer window1))
         (start (window-start window1))
         (point (window-point window1)))
    (set-window-buffer-start-and-point window1 (window-buffer window2) (window-start window2) (window-point window2))
    (set-window-buffer-start-and-point window2 buffer start point)))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-navigation)
