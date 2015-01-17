;; -----------------------------------------------------------------------------
;; theme -----------------------------------------------------------------------

;; theme
(setq custom-theme-directory +themes-dir+)
(load-theme 'ample t)

;; flycheck
(put 'error 'flycheck-fringe-bitmap 'filled-circle)
(put 'warning 'flycheck-fringe-bitmap 'filled-circle)
(put 'info 'flycheck-fringe-bitmap 'filled-circle)

(set-face-underline 'flycheck-error (cl-substitute 'line 'wave (face-attribute 'flycheck-error :underline)))
(set-face-underline 'flycheck-warning (cl-substitute 'line 'wave (face-attribute 'flycheck-warning :underline)))
(set-face-underline 'flycheck-info (cl-substitute 'line 'wave (face-attribute 'flycheck-info :underline)))


;; -----------------------------------------------------------------------------
;; bitmaps ---------------------------------------------------------------------

(define-fringe-bitmap 'filled-circle
  (vector #b00000000
          #b00000000
          #b00000000
          #b00000000
          #b00011100
          #b00111110
          #b00111110
          #b00111110
          #b00011100
          #b00000000))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-theme)
