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
                        ;; file tabs
                        `(tabbar-default ((t ,@+ui-font+ :foreground "black" :background "grey80")))
                        '(tabbar-selected ((t :inherit tabbar-default :foreground "grey15" :background "grey95")))
                        '(tabbar-selected-highlight ((t :inherit tabbar-selected)))
                        '(tabbar-unselected ((t :inherit tabbar-default)))
                        '(tabbar-unselected-highlight ((t :inherit tabbar-unselected :background "grey65")))
                        '(tabbar-separator ((t :inherit tabbar-default :background "grey50")))
                        ;; mode line
                        '(ml-buffer-name ((t :weight bold)))
                        '(ml-active-window-highlight ((t :foreground "cornsilk4" :background "#454545")))
                        '(ml-inactive-window-highlight ((t :foreground "#252525" :background "cornsilk4")))
                        ;; ivy
                        '(ivy-current-match ((t :background "gray17")))
                        '(ivy-minibuffer-match-face-1 ((t)))
                        '(ivy-minibuffer-match-face-2 ((t :inherit flx-highlight-face)))
                        '(ivy-minibuffer-match-face-3 ((t :inherit flx-highlight-face)))
                        '(ivy-minibuffer-match-face-4 ((t :inherit flx-highlight-face))))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-theme)
