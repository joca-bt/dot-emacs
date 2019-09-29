;; -----------------------------------------------------------------------------
;; theme -----------------------------------------------------------------------

(setq custom-theme-directory +themes-dir+)
(load-theme 'ample t)

(custom-theme-set-faces 'ample
                        ;; emacs
                        '(fringe ((t)))
                        '(line-number-current-line ((t)))
                        '(vertical-border ((t :foreground "#454545")))
                        '(isearch ((t :foreground "gray13" :background "#5180b3" :underline nil)))
                        '(match ((t :inherit isearch)))
                        '(error ((t :foreground "#cd5542" :weight bold)))
                        '(warning ((t :foreground "#df9522" :weight bold)))
                        '(success ((t :foreground "#6aaf50" :weight bold)))
                        ;; file tabs
                        `(tabbar-default ((t ,@+ui-font+ :foreground "black" :background "grey80")))
                        '(tabbar-selected ((t :inherit tabbar-default :foreground "grey15" :background "grey95")))
                        '(tabbar-selected-highlight ((t :inherit tabbar-selected)))
                        '(tabbar-unselected ((t :inherit tabbar-default)))
                        '(tabbar-unselected-highlight ((t :inherit tabbar-unselected :background "grey65")))
                        '(tabbar-separator ((t :inherit tabbar-default :background "grey50")))
                        ;; mode line
                        '(ml-buffer-name ((t :weight bold)))
                        '(ml-active-highlight ((t :foreground "cornsilk4" :background "#454545")))
                        '(ml-inactive-highlight ((t :foreground "#252525" :background "cornsilk4")))
                        ;; flycheck
                        '(flycheck-error-list-highlight ((t :background "gray17")))
                        '(flycheck-error ((t :underline "#cd5542")))
                        '(flycheck-warning ((t :underline "#df9522")))
                        '(flycheck-info ((t :underline "#6aaf50")))
                        ;; ivy
                        '(ivy-current-match ((t :background "gray17")))
                        '(ivy-minibuffer-match-face-1 ((t)))
                        '(ivy-minibuffer-match-face-2 ((t :inherit flx-highlight-face)))
                        '(ivy-minibuffer-match-face-3 ((t :inherit flx-highlight-face)))
                        '(ivy-minibuffer-match-face-4 ((t :inherit flx-highlight-face)))
                        ;; swiper
                        '(swiper-line-face ((t)))
                        '(swiper-match-face-1 ((t)))
                        '(swiper-match-face-2 ((t :inherit isearch)))
                        '(swiper-match-face-3 ((t :inherit isearch)))
                        '(swiper-match-face-4 ((t :inherit isearch)))
                        '(swiper-background-match-face-1 ((t)))
                        '(swiper-background-match-face-2 ((t :inherit lazy-highlight)))
                        '(swiper-background-match-face-3 ((t :inherit lazy-highlight)))
                        '(swiper-background-match-face-4 ((t :inherit lazy-highlight))))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-theme)
