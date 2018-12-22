;; -----------------------------------------------------------------------------
;; theme -----------------------------------------------------------------------

(setq custom-theme-directory +themes-dir+)
(load-theme 'ample t)

(custom-theme-set-faces 'ample
                        ;; ag
                        '(ag-match-face ((t :inherit isearch)))
                        ;; avy
                        '(avy-goto-char-timer-face ((t :inherit isearch)))
                        '(avy-lead-face-0 ((t :inherit avy-lead-face)))
                        '(avy-lead-face-1 ((t :inherit avy-lead-face)))
                        '(avy-lead-face-2 ((t :inherit avy-lead-face)))
                        ;; ivy
                        '(ivy-current-match ((t :background "gray18")))
                        '(ivy-minibuffer-match-face-1 ((t :inherit flx-highlight-face)))
                        '(ivy-minibuffer-match-face-2 ((t :inherit flx-highlight-face)))
                        '(ivy-minibuffer-match-face-3 ((t :inherit flx-highlight-face)))
                        '(ivy-minibuffer-match-face-4 ((t :inherit flx-highlight-face)))
                        ;; swiper
                        '(swiper-line-face ((t :inherit hl-line)))
                        '(swiper-match-face-1 ((t :inherit isearch)))
                        '(swiper-match-face-2 ((t :inherit isearch)))
                        '(swiper-match-face-3 ((t :inherit isearch)))
                        '(swiper-match-face-4 ((t :inherit isearch))))

;; flycheck
(put 'error 'flycheck-fringe-bitmap-double-arrow 'filled-circle)
(put 'warning 'flycheck-fringe-bitmap-double-arrow 'filled-circle)
(put 'info 'flycheck-fringe-bitmap-double-arrow 'filled-circle)
(set-face-underline 'flycheck-error (face-attribute 'error :foreground))
(set-face-underline 'flycheck-warning (face-attribute 'warning :foreground))
(set-face-underline 'flycheck-info (face-attribute 'success :foreground))

;; -----------------------------------------------------------------------------
;; bitmaps ---------------------------------------------------------------------

(define-fringe-bitmap 'filled-circle
  (vector #b00000000
          #b00000000
          #b00000000
          #b00011100
          #b00111110
          #b00111110
          #b00111110
          #b00011100))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-theme)
