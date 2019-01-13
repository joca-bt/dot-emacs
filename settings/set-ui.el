;; -----------------------------------------------------------------------------
;; ui --------------------------------------------------------------------------

(defconst +source-code-font+ (if +windows-p+
                                 '(:font "Consolas" :height 108)
                               '(:font "Source Code Pro" :height 143)))

(defconst +ui-font+ (if +windows-p+
                        '(:font "Segoe UI" :height 90)
                      '(:font "Noto Sans" :height 120)))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

;; font
(apply #'set-face-attribute 'default nil +source-code-font+)

;; theme
(require 'set-theme)

;; title bar
(require 'set-title-bar)

;; disable toolbar
(tool-bar-mode -1)

;; file tabs
(require 'set-file-tabs)

;; line numbers
(global-display-line-numbers-mode t)

;; highlight current line
(global-hl-line-mode t)

;; mode line
(require 'set-mode-line)

;; cursor
(setq-default cursor-type 'bar)
(setq         blink-cursor-blinks 0)

;; text wrapping
(setq-default truncate-lines t
              word-wrap t)

;; horizontal scrolling
(setq hscroll-margin 0
      hscroll-step 1
      mouse-wheel-tilt-scroll t
      mouse-wheel-flip-direction (not +windows-p+))

;; vertical scrolling
(setq scroll-margin 0
      scroll-step 1
      scroll-conservatively most-positive-fixnum
      scroll-preserve-screen-position t
      mouse-wheel-progressive-speed nil)

;; maximize frames
(setq default-frame-alist '((fullscreen . maximized)))

;; pop-up buffer/window management
(setq shackle-default-rule '(:select t)
      shackle-select-reused-windows t
      shackle-inhibit-window-quit-on-same-windows t)
(shackle-mode t)

;; disable prompts
(fset 'yes-or-no-p #'y-or-n-p)

;; disable beeping
(setq ring-bell-function #'ignore)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-ui)
