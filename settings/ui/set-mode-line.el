;; -------------------------------------------------- -*- lexical-binding: t -*-
;; mode line -------------------------------------------------------------------

(defvar ml-active-window nil)

(defun ml-active-window-p ()
  (eq (selected-window)
      ml-active-window))

(defun ml-set-active-window ()
  (let ((active-window (frame-selected-window)))
    (unless (minibuffer-window-active-p active-window)
      (setq ml-active-window active-window))))

(defadvice select-window (after ml-select-window activate)
  (ml-set-active-window))

(defadvice handle-switch-frame (after ml-handle-switch-frame activate)
  (ml-set-active-window))

(defun ml-make-keymap (&rest args)
  (let ((map (make-sparse-keymap)))
    (cl-loop for (key value) on args by #'cddr
             do (define-key map key value))
    (purecopy map)))

(defun ml-fill (reserve)
  (propertize " " 'display `(space :align-to (- right ,reserve))))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(defface ml-strong '((t :weight bold))
  "")

(defface ml-highlight '((t :box (:line-width 1 :color "grey25")))
  "")

(defun ml-buffer-name ()
  (propertize "%20b"
              'face 'ml-strong
              'mouse-face 'ml-highlight
              'pointer 'arrow
              'help-echo #'ml-buffer-name-help))

(defun ml-buffer-name-help (window object point)
  (with-selected-window window
    (let ((file-name (buffer-file-name)))
      (if file-name
          (abbreviate-file-name file-name)
        (buffer-name)))))

(defun ml-buffer-status ()
  (cond (buffer-read-only
         (propertize " RO "
                     'mouse-face 'ml-highlight
                     'pointer 'arrow
                     'help-echo #'ml-buffer-status-help))
        ((buffer-modified-p)
         (propertize " ** "
                     'mouse-face 'ml-highlight
                     'pointer 'arrow
                     'help-echo #'ml-buffer-status-help))
        (t
         "    ")))

(defun ml-buffer-status-help (window object point)
  (with-selected-window window
    (if buffer-read-only
        "The buffer is read-only"
      "The buffer has been modified")))

(defun ml-coding-system ()
  (let ((terminator (pcase (coding-system-eol-type buffer-file-coding-system)
                      (0 "unix")
                      (1 "dos")
                      (2 "mac")
                      (_ "undecided"))))
    (propertize terminator
                'mouse-face 'ml-highlight
                'pointer 'arrow
                'help-echo #'ml-coding-system-help
                'local-map ml-coding-system-keymap)))

(defun ml-coding-system-help (window object point)
  (with-selected-window window
    (let ((coding-system (if buffer-file-coding-system
                             (symbol-name buffer-file-coding-system)
                           "none")))
      (format "Coding system: %s\nmouse-2: Describe coding system" coding-system))))

(defvar ml-coding-system-keymap
  (ml-make-keymap [mode-line mouse-2] #'(lambda (event)
                                          (interactive "@e")
                                          (describe-coding-system buffer-file-coding-system))))

(defun ml-major-mode ()
  (propertize mode-name
              'mouse-face 'ml-highlight
              'pointer 'arrow
              'help-echo #'ml-major-mode-help
              'local-map ml-major-mode-keymap))

(defun ml-major-mode-help (window object point)
  (with-selected-window window
    "Major mode\nmouse-1: Show major mode menu\nmouse-2: Describe major mode"))

(defvar ml-major-mode-keymap
  (ml-make-keymap [mode-line mouse-1] `(menu-item "Menu Bar" ,#'ignore :filter ,#'(lambda (_)
                                                                                    (mouse-menu-major-mode-map)))
                  [mode-line mouse-2] #'describe-mode))

(defun ml-minor-modes ()
  (string-join (cl-loop for (mode lighter) in minor-mode-alist
                        when (and (boundp mode)
                                  (symbol-value mode)
                                  (not (string-empty-p (setq lighter (string-trim (format-mode-line lighter))))))
                        collect (propertize lighter
                                            'mouse-face 'ml-highlight
                                            'pointer 'arrow
                                            'help-echo #'ml-minor-mode-help
                                            'local-map (ml-minor-mode-keymap lighter)))
               " "))

(defun ml-minor-mode-help (window object point)
  (with-selected-window window
    "Minor mode\nmouse-1: Show minor mode menu\nmouse-2: Describe minor mode"))

(defun ml-minor-mode-keymap (lighter)
  (ml-make-keymap [mode-line mouse-1] #'(lambda (event)
                                          (interactive "@e")
                                          (minor-mode-menu-from-indicator lighter))
                  [mode-line mouse-2] #'(lambda (event)
                                          (interactive "@e")
                                          (describe-minor-mode-from-indicator lighter))))

(defun ml-position ()
  (let ((space (propertize " " 'display '(space :width 0.33)))
        (column (number-to-string (1+ (current-column)))))
    `("%l" ,space ":" ,space ,column)))

(setq-default mode-line-format '(:eval (let ((left `("    "
                                                     (:eval (ml-buffer-status))
                                                     "    "
                                                     (:eval (ml-buffer-name))
                                                     "    "
                                                     (:eval (ml-major-mode))
                                                     ,@(when (ml-active-window-p)
                                                         '("    "
                                                           (:eval (ml-minor-modes))))))
                                             (right '((:eval (ml-coding-system))
                                                      " | "
                                                      (:eval (ml-position)))))
                                         `(,left
                                           ,(ml-fill (- (string-width (format-mode-line right))
                                                        1.34))
                                           ,right))))

(setq mode-line-default-help-echo nil)

(diminish 'company-mode)
(diminish 'eldoc-mode)
(diminish 'ivy-mode)
(diminish 'server-mode)
(diminish 'smartparens-mode)
(diminish 'undo-tree-mode)
(diminish 'ws-butler-mode)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-mode-line)
