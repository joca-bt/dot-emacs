;;; powerline-separators.el --- Separators for Powerline

;; Copyright (C) 2012-2013 Donald Ephraim Curtis
;; Copyright (C) 2013 Jason Milkins
;; Copyright (C) 2012 Nicolas Rougier

;; Author: Donald Ephraim Curtis <dcurtis@milkbox.net>
;; URL: http://github.com/milkypostman/powerline/
;; Version: 2.0
;; Keywords: mode-line

;;; Commentary:
;;
;; Separators for Powerline.
;; Included separators: arrow, arrow-hollow, bar, box, butt, contour, slant,
;; nil, and utf-8.
;;

;;; Code:

(require 'cl-lib)
(require 'color)

(defun pl/interpolate (color1 color2)
  "Interpolate between COLOR1 and COLOR2.

COLOR1 and COLOR2 must be supplied as hex strings with a leading #."
  (let* ((c1 (color-name-to-rgb color1))
         (c2 (color-name-to-rgb color2))
         (red (/ (+ (nth 0 c1) (nth 0 c2)) 2))
         (green (/ (+ (nth 1 c1) (nth 1 c2)) 2))
         (blue (/ (+ (nth 2 c1) (nth 2 c2)) 2)))
    (color-rgb-to-hex red green blue)))

(defun pl/hex-color (color)
  "Get the hexadecimal value of COLOR."
  (when color
    (apply 'color-rgb-to-hex (color-name-to-rgb color))))

(defun pl/pattern (lst)
  "Turn LST into an infinite pattern."
  (when lst
    (let ((pattern (cl-copy-list lst)))
      (setcdr (last pattern) pattern))))

(defun pl/pattern-to-string (pattern)
  "Convert a PATTERN into a string that can be used in an XPM."
  (concat "\"" (mapconcat 'number-to-string pattern "") "\","))

(defun pl/reverse-pattern (pattern)
  "Reverse each line in PATTERN."
  (mapcar 'reverse pattern))

(defun pl/row-pattern (fill total &optional fade)
  "Make a list that has FILL 0s out of TOTAL 1s with FADE 2s to the right of the fill."
  (unless fade
    (setq fade 0))
  (let ((fill (min fill total))
        (fade (min fade (max (- total fill) 0))))
    (append (make-list fill 0)
            (make-list fade 2)
            (make-list (- total fill fade) 1))))

(defun pl/row-pattern-hollow (left-padding total)
  "Make a list that has LEFT-PADDING 0s, followed by a 2 and a 1, then up to TOTAL 0s."
  (let ((left-padding (min left-padding (- total 2))))
    (append (make-list left-padding 0)
            '(2 1)
            (make-list (- total left-padding 2) 0))))

(defun pl/pattern-defun (name dir width &rest patterns)
  "Create a powerline function of NAME in DIR with WIDTH for PATTERNS.

PATTERNS is of the form (PATTERN HEADER FOOTER SECOND-PATTERN CENTER).
PATTERN is required, all other components are optional.

All generated functions generate the form:
HEADER
PATTERN ...
CENTER
SECOND-PATTERN ...
FOOTER

PATTERN and SECOND-PATTERN repeat infinitely to fill the space needed to generate a full height XPM.

PATTERN, HEADER, FOOTER, SECOND-PATTERN, CENTER are of the form ((COLOR ...) (COLOR ...) ...).

COLOR can be one of 0, 1, or 2, where 0 is the source color, 1 is the
destination color, and 2 is the interpolated color between 0 and 1."
  (when (eq dir 'right)
    (setq patterns (mapcar 'pl/reverse-pattern patterns)))
  (let* ((pattern (pl/pattern (mapcar 'pl/pattern-to-string (car patterns))))
         (header (mapcar 'pl/pattern-to-string (nth 1 patterns)))
         (footer (mapcar 'pl/pattern-to-string (nth 2 patterns)))
         (second-pattern (pl/pattern (mapcar 'pl/pattern-to-string (nth 3 patterns))))
         (center (mapcar 'pl/pattern-to-string (nth 4 patterns)))
         (reserve (+ (length header) (length footer) (length center))))
    (pl/wrap-defun name dir width
                   `((pattern-height (max (- height ,reserve) 0))
                     (second-pattern-height (/ pattern-height 2))
                     (pattern-height ,(if second-pattern '(ceiling pattern-height 2) 'pattern-height)))
                   `((mapconcat 'identity ',header "")
                     (mapconcat 'identity (cl-subseq ',pattern 0 pattern-height) "")
                     (mapconcat 'identity ',center "")
                     (mapconcat 'identity (cl-subseq ',second-pattern 0 second-pattern-height) "")
                     (mapconcat 'identity ',footer "")))))

(defun pl/wrap-defun (name dir width let-vars body)
  "Generate a powerline function of NAME in DIR with WIDTH using LET-VARS and BODY."
  (let* ((src-face (if (eq dir 'left) 'face1 'face2))
         (dst-face (if (eq dir 'left) 'face2 'face1)))
    `(defun ,(intern (format "powerline-%s-%s" name (symbol-name dir)))
         (face1 face2 &optional height)
       (when window-system
         (unless height
           (setq height (pl/separator-height)))
         (let* ,(append `((color1 (when ,src-face
                                    (pl/hex-color (face-background ,src-face))))
                          (color2 (when ,dst-face
                                    (pl/hex-color (face-background ,dst-face))))
                          (colori (when (and color1 color2) (pl/interpolate color1 color2)))
                          (color1 (or color1 "None"))
                          (color2 (or color2 "None"))
                          (colori (or colori "None")))
                        let-vars)
           (create-image ,(append `(concat (format "/* XPM */ static char * %s_%s[] = { \"%s %s 3 1\", \"0 c %s\", \"1 c %s\", \"2 c %s\","
                                                   ,(replace-regexp-in-string "-" "_" name)
                                                   (symbol-name ',dir)
                                                   ,width
                                                   height
                                                   color1
                                                   color2
                                                   colori))
                                  body
                                  '("};"))
                         'xpm t
                         :ascent 'center
                         :face (when (and face1 face2)
                                 ,dst-face)))))))

(defmacro pl/arrow (dir)
  "Generate an arrow XPM function for DIR."
  (let ((row-modifier (if (eq dir 'left) 'identity 'reverse)))
    (pl/wrap-defun "arrow" dir 'middle-width
                   '((width (1- (/ height 2)))
                     (middle-width (1- (ceiling height 2))))
                   `((cl-loop for i from 0 to width
                              concat (pl/pattern-to-string (,row-modifier (pl/row-pattern i middle-width))))
                     (when (cl-oddp height)
                       (pl/pattern-to-string (make-list middle-width 0)))
                     (cl-loop for i from width downto 0
                              concat (pl/pattern-to-string (,row-modifier (pl/row-pattern i middle-width))))))))

(defmacro pl/arrow-hollow (dir)
  "Generate an arrow-hollow XPM function for DIR."
  (let* ((row-modifier (if (eq dir 'left) 'identity 'reverse)))
    (pl/wrap-defun "arrow-hollow" dir 'middle-width
                   '((width (1- (/ height 2)))
                     (middle-width (1+ (ceiling height 2))))
                   `((cl-loop for i from 0 to width
                              concat (pl/pattern-to-string (,row-modifier (pl/row-pattern-hollow i middle-width))))
                     (when (cl-oddp height)
                       (pl/pattern-to-string (,row-modifier (pl/row-pattern-hollow (1+ width) middle-width))))
                     (cl-loop for i from width downto 0
                              concat (pl/pattern-to-string (,row-modifier (pl/row-pattern-hollow i middle-width))))))))

(defmacro pl/bar (dir)
  "Generate a bar XPM function for DIR."
  (pl/pattern-defun "bar" dir 2
                    '((2 2))))

(defmacro pl/box (dir)
  "Generate a box XPM function for DIR."
  (pl/pattern-defun "box" dir 2
                    '((0 0)
                      (0 0)
                      (1 1)
                      (1 1))))

(defmacro pl/butt (dir)
  "Generate a butt XPM function for DIR."
  (pl/pattern-defun "butt" dir 3
                    '((0 0 0))
                    '((1 1 1)
                      (0 1 1)
                      (0 0 1))
                    '((0 0 1)
                      (0 1 1)
                      (1 1 1))))

(defmacro pl/contour (dir)
  "Generate a contour XPM function for DIR."
  (pl/pattern-defun "contour" dir 10
                    '((0 0 0 0 0 1 1 1 1 1))
                    '((1 1 1 1 1 1 1 1 1 1)
                      (0 2 1 1 1 1 1 1 1 1)
                      (0 0 2 1 1 1 1 1 1 1)
                      (0 0 0 2 1 1 1 1 1 1)
                      (0 0 0 0 1 1 1 1 1 1)
                      (0 0 0 0 2 1 1 1 1 1))
                    '((0 0 0 0 0 2 1 1 1 1)
                      (0 0 0 0 0 0 1 1 1 1)
                      (0 0 0 0 0 0 2 1 1 1)
                      (0 0 0 0 0 0 0 2 1 1)
                      (0 0 0 0 0 0 0 0 0 0))))

(defmacro pl/slant (dir)
  "Generate a slant XPM function for DIR."
  (let* ((row-modifier (if (eq dir 'left) 'identity 'reverse)))
    (pl/wrap-defun "slant" dir 'width
                   '((width (1- (ceiling height 2))))
                   `((cl-loop for i from 0 to height
                              concat (pl/pattern-to-string (,row-modifier (pl/row-pattern (/ i 2) width))))))))

(defmacro pl/nil (dir)
  "Generate a XPM function that returns nil for DIR."
  `(defun ,(intern (format "powerline-nil-%s" (symbol-name dir)))
       (face1 face2 &optional height)
     nil))

(defun powerline-utf-8-right (f1 f2 &optional height) (powerline-raw (char-to-string powerline-utf-8-separator-right) (list :foreground (face-attribute f2 :background) :background (face-attribute f1 :background))))

(defun powerline-utf-8-left (f1 f2 &optional height) (powerline-raw (char-to-string powerline-utf-8-separator-left) (list :foreground (face-attribute f1 :background) :background (face-attribute f2 :background))))

(provide 'powerline-separators)

;;; powerline-separators.el ends here