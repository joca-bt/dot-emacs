;; -----------------------------------------------------------------------------
;; display ---------------------------------------------------------------------

;;(setq redisplay-dont-pause t) ; better responsiveness

(set-face-attribute 'default nil :font "Consolas" :height 108) ; font

;; colour theme
(setq custom-theme-directory +themes-dir+)
(load-theme 'ample t)

(require 'config-title-bar) ; title bar

(tool-bar-mode -1) ; toolbar

(require 'config-file-tabs) ; file tabs

;; line numbers
(require 'linum)
(global-linum-mode t)

(setq-default cursor-type 'bar) ; cursor

;; text wrapping
(setq-default truncate-lines t
              word-wrap t)

;; smooth vertical scrolling
(setq scroll-margin 0
      scroll-step 1
      scroll-conservatively -1
      scroll-preserve-screen-position t
      mouse-wheel-progressive-speed nil)

(require 'config-mode-line) ; mode line


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-display)
