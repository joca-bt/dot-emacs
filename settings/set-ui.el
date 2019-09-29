;; -----------------------------------------------------------------------------
;; ui --------------------------------------------------------------------------

(defconst +editor-font+ (if +windows-p+
                            '(:font "Consolas" :height 108)
                          '(:font "Source Code Pro" :height 143)))

(defconst +ui-font+ (if +windows-p+
                        '(:font "Segoe UI" :height 90)
                      '(:font "Noto Sans" :height 120)))

(defun make-space (size)
  (propertize " " 'display `(space :width ,size)))

(defun make-xpm (height width &optional color)
  (let ((xpm (format "/* XPM */ static char * xpm[] = { \"%s %s 1 1\", \". c %s\", %s };"
                     width
                     height
                     (or color "none")
                     (apply #'concat (make-list height (format "\"%s\"," (make-string width ?.)))))))
    (propertize " " 'display (create-image xpm 'xpm t :ascent 'center))))

(defun set-face (face spec)
  (face-spec-set face spec 'face-defface-spec))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

;; font
(apply #'set-face-attribute 'default nil +editor-font+)

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

;; disable scrollbars
(scroll-bar-mode -1)

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
