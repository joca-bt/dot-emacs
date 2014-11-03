;; -----------------------------------------------------------------------------
;; display ---------------------------------------------------------------------

(set-face-attribute 'default nil :font "Consolas" :height 108) ; font

;; colour theme
(setq custom-theme-directory +themes-dir+)
(load-theme 'ample t)

(require 'config-title-bar) ; title bar

(tool-bar-mode -1) ; toolbar

(require 'config-file-tabs) ; file tabs

(require 'config-mode-line) ; mode line

;; highlight current line
(require 'hl-line)
(global-hl-line-mode t)

(transient-mark-mode t) ; highlight active region

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
