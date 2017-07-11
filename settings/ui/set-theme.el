;; -----------------------------------------------------------------------------
;; theme -----------------------------------------------------------------------

(setq custom-theme-directory +themes-dir+)
(load-theme 'ample t)

(custom-theme-set-faces 'ample
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


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-theme)
