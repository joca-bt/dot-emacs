;; -----------------------------------------------------------------------------
;; theme -----------------------------------------------------------------------

(setq custom--inhibit-theme-enable nil
      custom-theme-directory +themes-dir+)
(load-theme 'ample t)

(custom-theme-set-faces 'ample
                        ;; emacs
                        '(fringe ((t)))
                        '(line-number-current-line ((t)))
                        '(vertical-border ((t :foreground "gray27")))
                        '(isearch ((t :background "#5180b3" :foreground "gray13" :underline nil)))
                        '(match ((t :inherit isearch)))
                        ;; file tabs
                        '(tabbar-default ((t :inherit variable-pitch :height 0.9 :background "grey85" :foreground "black")))
                        '(tabbar-selected ((t :inherit tabbar-default)))
                        '(tabbar-selected-highlight ((t :inherit tabbar-selected)))
                        '(tabbar-unselected ((t :inherit tabbar-default :background "grey75")))
                        '(tabbar-unselected-highlight ((t :inherit tabbar-selected-highlight)))
                        '(tabbar-separator ((t :inherit tabbar-default :background "grey55")))
                        ;; mode line
                        '(ml-buffer-name ((t :weight bold)))
                        '(ml-active-window-highlight ((t :inherit mode-line-inactive)))
                        '(ml-inactive-window-highlight ((t :inherit mode-line)))
                        ;; ivy
                        '(ivy-current-match ((t :background "gray17" :extend t)))
                        '(ivy-minibuffer-match-face-1 ((t)))
                        '(ivy-minibuffer-match-face-2 ((t :inherit flx-highlight-face)))
                        '(ivy-minibuffer-match-face-3 ((t :inherit flx-highlight-face)))
                        '(ivy-minibuffer-match-face-4 ((t :inherit flx-highlight-face))))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-theme)
