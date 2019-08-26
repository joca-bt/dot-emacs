;; -------------------------------------------------- -*- lexical-binding: t -*-
;; mode line -------------------------------------------------------------------

(defface ml-buffer-name '((t))
  "")

(defface ml-active-highlight '((t))
  "")

(defface ml-inactive-highlight '((t))
  "")

(defvar ml-active-window nil)

(defun ml-active-window-p ()
  (eq (selected-window) ml-active-window))

(defun ml-set-active-window (&rest args)
  (let ((active-window (selected-window)))
    (unless (minibuffer-window-active-p active-window)
      (setq ml-active-window active-window))))

(advice-add 'select-window :after #'ml-set-active-window)
(advice-add 'select-frame :after #'ml-set-active-window)

(defun ml-fill (size)
  (propertize " " 'display `(space :align-to (- right ,size))))

(defun ml-highlight ()
  (if (ml-active-window-p)
      'ml-active-highlight
    'ml-inactive-highlight))

(defun ml-make-keymap (&rest args)
  (let ((keymap (make-sparse-keymap)))
    (cl-loop for (key value) on args by #'cddr
             do (define-key keymap key value))
    keymap))

(defun ml-set-height (height)
  (make-xpm 25 1))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(defun ml-buffer-name ()
  (propertize "%20b"
              'face 'ml-buffer-name
              'mouse-face (ml-highlight)
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
                     'mouse-face (ml-highlight)
                     'pointer 'arrow
                     'help-echo #'ml-buffer-status-help))
        ((and (buffer-modified-p)
              (buffer-file-name))
         (propertize " ** "
                     'mouse-face (ml-highlight)
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
                      (_ "!?"))))
    (propertize terminator
                'mouse-face (ml-highlight)
                'pointer 'arrow
                'help-echo #'ml-coding-system-help
                'local-map ml-coding-system-keymap)))

(defun ml-coding-system-help (window object point)
  (with-selected-window window
    (let ((coding-system (if buffer-file-coding-system
                             (symbol-name buffer-file-coding-system)
                           "!?")))
      (format "%s\nmouse-2: Describe coding system\nmouse-3: Set coding system" coding-system))))

(defvar ml-coding-system-keymap
  (ml-make-keymap [mode-line mouse-2] (lambda (event)
                                        (interactive "@e")
                                        (describe-coding-system buffer-file-coding-system))
                  [mode-line mouse-3] #'set-buffer-file-coding-system))

(defun ml-major-mode ()
  (propertize mode-name
              'mouse-face (ml-highlight)
              'pointer 'arrow
              'help-echo #'ml-major-mode-help
              'local-map ml-major-mode-keymap))

(defun ml-major-mode-help (window object point)
  (with-selected-window window
    "Major mode\nmouse-1: Show major mode menu\nmouse-2: Describe major mode"))

(defvar ml-major-mode-keymap
  (ml-make-keymap [mode-line mouse-1] '(menu-item "Major Mode" nil :filter (lambda (command)
                                                                             (mouse-menu-major-mode-map)))
                  [mode-line mouse-2] #'describe-mode))

(defun ml-minor-modes ()
  (string-join (cl-loop for (mode lighter) in minor-mode-alist
                        when (and (boundp mode)
                                  (symbol-value mode)
                                  (not (string-empty-p (setq lighter (string-trim (format-mode-line lighter))))))
                        collect (propertize lighter
                                            'mouse-face (ml-highlight)
                                            'pointer 'arrow
                                            'help-echo #'ml-minor-mode-help
                                            'local-map (ml-minor-mode-keymap lighter)))
               " "))

(defun ml-minor-mode-help (window object point)
  (with-selected-window window
    "Minor mode\nmouse-1: Show minor mode menu\nmouse-2: Describe minor mode"))

(defun ml-minor-mode-keymap (lighter)
  (ml-make-keymap [mode-line mouse-1] (lambda (event)
                                        (interactive "@e")
                                        (minor-mode-menu-from-indicator lighter))
                  [mode-line mouse-2] (lambda (event)
                                        (interactive "@e")
                                        (describe-minor-mode-from-indicator lighter))))

(defun ml-position ()
  (format "%%l%s:%s%%C" (make-space 0.33) (make-space 0.33)))

(defun ml-project ()
  (propertize (projectile-project-name)
              'mouse-face (ml-highlight)
              'pointer 'arrow
              'help-echo #'ml-project-help
              'local-map ml-project-keymap))

(defun ml-project-help (window object point)
  (with-selected-window window
    "Projectile\nmouse-1: Show Projectile menu"))

(defvar ml-project-keymap
  (ml-make-keymap [mode-line mouse-1] projectile-mode-menu))

(defun ml-syntax-checking ()
  (let-alist (flycheck-count-errors flycheck-current-errors)
    (let ((indicator (pcase flycheck-last-status-change
                       ('running "*")
                       ((or 'errored 'interrupted 'suspicious) "!")
                       (_ "-")))
          (errors (or .error 0))
          (warnings (or .warning 0))
          (infos (or .info 0)))
      (propertize (if (and (eq flycheck-last-status-change 'finished)
                           (> (+ errors warnings infos) 0))
                      (format "%s|%s|%s" errors warnings infos)
                    indicator)
                  'mouse-face (ml-highlight)
                  'pointer 'arrow
                  'help-echo #'ml-syntax-checking-help
                  'local-map ml-syntax-checking-keymap))))

(defun ml-syntax-checking-help (window object point)
  (with-selected-window window
    "Flycheck\nmouse-1: Show Flycheck menu"))

(defvar ml-syntax-checking-keymap
  (ml-make-keymap [mode-line mouse-1] flycheck-mode-menu-map))

(setq-default mode-line-format '(:eval (let ((left `("    "
                                                     (:eval (ml-buffer-status))
                                                     "    "
                                                     (:eval (ml-buffer-name))
                                                     "    "
                                                     (:eval (ml-major-mode))
                                                     ,@(when (ml-active-window-p)
                                                         `("    "
                                                           ,@(when (flycheck-get-checker-for-buffer)
                                                               '((:eval (ml-syntax-checking))
                                                                 "  "))
                                                           (:eval (ml-minor-modes))))))
                                             (right `(,@(when (and (ml-active-window-p)
                                                                   (projectile-project-p))
                                                          '((:eval (ml-project))
                                                            "    "))
                                                      (:eval (ml-coding-system))
                                                      " | "
                                                      (:eval (ml-position)))))
                                         `(,left
                                           ,(ml-set-height 25)
                                           ,(ml-fill (- (string-width (format-mode-line right))
                                                        1.34))
                                           ,right))))

(setq mode-line-default-help-echo nil)

(diminish 'company-mode)
(diminish 'eldoc-mode)
(diminish 'flycheck-mode)
(diminish 'ivy-mode)
(diminish 'projectile-mode)
(diminish 'server-buffer-clients)
(diminish 'smartparens-mode)
(diminish 'undo-tree-mode)
(diminish 'ws-butler-mode)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-mode-line)
