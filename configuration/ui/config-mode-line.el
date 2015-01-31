;; -------------------------------------------------- -*- lexical-binding: t -*-
;; mode line -------------------------------------------------------------------
;;
;; based on Emacs' bindings.el

(setq-default mode-line-format '((:eval (ml-powerline))))

(setq mode-line-default-help-echo nil)

(defun ml-powerline ()
  (let ((active-p (powerline-selected-window-active))
        (lhs (list (powerline-raw " ")
                   (powerline-raw (ml-encoding-and-terminator))
                   (powerline-raw "  ")
                   (powerline-raw (ml-position))
                   (powerline-raw "  ")
                   (powerline-raw (ml-buffer-status))
                   (powerline-raw "  ")
                   (powerline-raw (ml-buffer-name))
                   (powerline-raw "  ")
                   (powerline-raw (ml-major-mode))
                   (powerline-raw " ")
                   (powerline-raw (ml-minor-modes))))
        (rhs (list (powerline-raw " "))))
    (concat (powerline-render lhs)
            (powerline-fill 'powerline-active1 (powerline-width rhs))
            (powerline-render rhs))))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(defface ml-highlight '((t :inherit nil
                           :box (:line-width 1 :color "grey25" :style nil)))
  "")

(defface ml-strong '((t :inherit nil
                        :weight bold))
  "")


;; -----------------------------------------------------------------------------
;; encoding and terminator -----------------------------------------------------

(defun ml-encoding-and-terminator ()
  (propertize "%Z"
              'mouse-face 'ml-highlight
              'pointer 'arrow
              'help-echo 'ml-encoding-and-terminator-help
              'local-map ml-encoding-and-terminator-map))

(defun ml-encoding-and-terminator-help (window object point)
  (with-selected-window window
    (let ((encoding (if buffer-file-coding-system
                        (format "%s (%s)"
                                buffer-file-coding-system
                                (if enable-multibyte-characters
                                    "multibyte"
                                  "unibyte"))
                      "none"))
          (terminator (let ((terminators ["Unix (LF)" "DOS (CR/LF)" "Mac (CR)" "undecided"])
                            (index (coding-system-eol-type buffer-file-coding-system)))
                        (aref terminators
                              (if (integerp index)
                                  index
                                3)))))
      (format "Encoding: %s\nTerminator: %s\nmouse-2: Describe encoding and terminator"
              encoding
              terminator))))

(defvar ml-encoding-and-terminator-map
  (let ((map (make-sparse-keymap)))
    (define-key map [mode-line mouse-2] #'(lambda (event)
                                            (interactive "@e")
                                            (with-selected-window (posn-window (event-start event))
                                              (describe-coding-system buffer-file-coding-system))))
    (purecopy map)))


;; -----------------------------------------------------------------------------
;; position --------------------------------------------------------------------

(defun ml-position ()
  (let ((space (propertize " " 'display '(space :width 0.33))))
    `("%l"
      ,space
      ":"
      ,space
      ,(format "%d" (+ (current-column) 1)))))


;; -----------------------------------------------------------------------------
;; buffer status ---------------------------------------------------------------

(defun ml-buffer-status ()
  (cond (buffer-read-only
         (propertize " RO "
                     'mouse-face 'ml-highlight
                     'pointer 'arrow
                     'help-echo 'ml-buffer-status-help))
        ((buffer-modified-p)
         (propertize " ** "
                     'mouse-face 'ml-highlight
                     'pointer 'arrow
                     'help-echo 'ml-buffer-status-help))
        (t
         "    ")))

(defun ml-buffer-status-help (window object point)
  (with-selected-window window
    (if buffer-read-only
        "The buffer is read-only"
      "The buffer has been modified")))


;; -----------------------------------------------------------------------------
;; buffer name -----------------------------------------------------------------

(defun ml-buffer-name ()
  (propertize "%20b"
              'face 'ml-strong
              'mouse-face 'ml-highlight
              'pointer 'arrow
              'help-echo 'ml-buffer-name-help))

(defun ml-buffer-name-help (window object point)
  (with-selected-window window
    (let ((file-name (buffer-file-name)))
      (if file-name
          (abbreviate-file-name file-name)
        (buffer-name)))))


;; -----------------------------------------------------------------------------
;; major mode ------------------------------------------------------------------

(defun ml-major-mode ()
  (propertize (format-mode-line mode-name)
              'mouse-face 'ml-highlight
              'pointer 'arrow
              'help-echo 'ml-major-mode-help
              'local-map ml-major-mode-map))

(defun ml-major-mode-help (window object point)
  (with-selected-window window
    "Major mode\nmouse-1: Show major mode menu\nmouse-2: Describe major mode\nmouse-3: Toggle minor modes"))

(defvar ml-major-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [mode-line mouse-1] `(menu-item "Menu Bar" ignore :filter ,#'(lambda (_)
                                                                                   (mouse-menu-major-mode-map))))
    (define-key map [mode-line mouse-2] 'describe-mode)
    (define-key map [mode-line mouse-3] mode-line-mode-menu)
    (purecopy map)))


;; -----------------------------------------------------------------------------
;; minor modes -----------------------------------------------------------------

(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "doxymacs" '(diminish 'doxymacs-mode))
(eval-after-load "elisp-slime-nav" '(diminish 'elisp-slime-nav-mode))
(eval-after-load "region-bindings-mode" '(diminish 'region-bindings-mode))
(eval-after-load "shackle" '(diminish 'shackle-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "undo-tree" '(diminish 'undo-tree-mode))
(eval-after-load "ws-trim" '(diminish 'ws-trim-mode))

(defun ml-minor-modes ()
  (let ((minor-modes (mapcar #'(lambda (mode)
                                 (propertize mode
                                             'mouse-face 'ml-highlight
                                             'pointer 'arrow
                                             'help-echo 'ml-minor-mode-help
                                             'local-map (ml-minor-mode-map mode)))
                             (split-string (format-mode-line minor-mode-alist)))))
    (butlast (cl-merge 'list
                       minor-modes
                       (make-list (length minor-modes) " ")
                       (let ((interleaver t))
                         #'(lambda (&rest args)
                             (setf interleaver (not interleaver))))))))

(defun ml-minor-mode-help (window object point)
  (with-selected-window window
    "Minor mode\nmouse-1: Show minor mode menu\nmouse-2: Describe minor mode\nmouse-3: Toggle minor modes"))

(defun ml-minor-mode-map (mode)
  (let ((map (make-sparse-keymap)))
    (define-key map [mode-line mouse-1] #'(lambda (event)
                                            (interactive "@e")
                                            (minor-mode-menu-from-indicator mode)))
    (define-key map [mode-line mouse-2] #'(lambda (event)
                                            (interactive "@e")
                                            (describe-minor-mode-from-indicator mode)))
    (define-key map [mode-line mouse-3] mode-line-mode-menu)
    (purecopy map)))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-mode-line)
