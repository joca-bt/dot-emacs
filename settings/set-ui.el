;; -----------------------------------------------------------------------------
;; ui --------------------------------------------------------------------------

;; font
(set-face-attribute 'default nil :font "Consolas" :height 108)

;; theme
(require 'set-theme)

;; title bar
(require 'set-title-bar)

;; toolbar
(tool-bar-mode -1)

;; file tabs
(require 'set-file-tabs)

;; line numbers
(global-linum-mode t)

;; mode line
(require 'set-mode-line)

;; highlight current line
(global-hl-line-mode t)

;; cursor
(setq-default cursor-type 'bar)
(setq         blink-cursor-blinks 0)

;; text wrapping
(setq-default truncate-lines t
              word-wrap t)

;; horizontal scrolling
(setq hscroll-margin 0
      hscroll-step 1)

;; vertical scrolling
(setq scroll-margin 0
      scroll-step 1
      scroll-conservatively most-positive-fixnum
      scroll-preserve-screen-position t
      mouse-wheel-progressive-speed nil)

;; pop-up buffer/window management
(setq shackle-default-rule '(:select t)
      shackle-select-reused-windows t
      shackle-inhibit-window-quit-on-same-windows t)
(shackle-mode t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-ui)
