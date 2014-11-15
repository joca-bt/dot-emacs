;; -----------------------------------------------------------------------------
;; display ---------------------------------------------------------------------

;; font
(set-face-attribute 'default nil :font "Consolas" :height 108)

;; colour theme
(setq custom-theme-directory +themes-dir+)
(load-theme 'ample t)

;; title bar
(require 'config-title-bar)

;; toolbar
(tool-bar-mode -1)

;; file tabs
(require 'config-file-tabs)

;; mode line
(require 'config-mode-line)

;; highlight current line
(require 'hl-line)
(global-hl-line-mode t)

;; highlight active region
(transient-mark-mode t)

;; line numbers
(require 'linum)
(global-linum-mode t)

;; cursor
(setq-default cursor-type 'bar)
(setq blink-cursor-blinks 0)

;; text wrapping
(setq-default truncate-lines t
              word-wrap t)

;; vertical scrolling
(setq scroll-margin 0
      scroll-step 1
      scroll-conservatively -1
      scroll-preserve-screen-position t
      mouse-wheel-progressive-speed nil)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-display)
