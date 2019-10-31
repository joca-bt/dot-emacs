;; -------------------------------------------------- -*- lexical-binding: t -*-
;; mode line -------------------------------------------------------------------

(defface ml-buffer-name '((t))
  "")

(defface ml-active-window-highlight '((t))
  "")

(defface ml-inactive-window-highlight '((t))
  "")

(defvar ml-active-window nil)

(defun ml-active-window-p ()
  (eq (selected-window) ml-active-window))

(defun ml-set-active-window (&rest _)
  (let ((active-window (selected-window)))
    (unless (minibuffer-window-active-p active-window)
      (setq ml-active-window active-window))))

(advice-add 'select-window :after #'ml-set-active-window)
(advice-add 'select-frame :after #'ml-set-active-window)

(defun ml-fill (size)
  (propertize " " 'display `(space :align-to (- right ,size))))

(defun ml-highlight ()
  (if (ml-active-window-p)
      'ml-active-window-highlight
    'ml-inactive-window-highlight))

(defun ml-make-keymap (&rest map)
  (let ((keymap (make-sparse-keymap)))
    (cl-loop for (key value) on map by #'cddr
             do (define-key keymap key value))
    keymap))

(defun ml-propertize (string &rest properties)
  (propertize string
              'face (plist-get properties 'face)
              'mouse-face (ml-highlight)
              'pointer 'arrow
              'help-echo (plist-get properties 'help-echo)
              'local-map (plist-get properties 'local-map)))

(defun ml-set-height (height)
  (make-xpm height 1))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(defun ml-buffer-name ()
  (ml-propertize "%20b"
                 'face 'ml-buffer-name
                 'help-echo (ml-buffer-name-help)))

(defun ml-buffer-name-help ()
  (if-let ((file-name (buffer-file-name)))
      (abbreviate-file-name file-name)
    (buffer-name)))

(defun ml-coding-system ()
  (let ((terminator (pcase (coding-system-eol-type buffer-file-coding-system)
                      (0 "unix")
                      (1 "dos")
                      (2 "mac")
                      (_ "!?"))))
    (ml-propertize terminator
                   'help-echo (ml-coding-system-help)
                   'local-map ml-coding-system-keymap)))

(defun ml-coding-system-help ()
  (let ((coding-system (or buffer-file-coding-system "!?")))
    (format "%s\nmouse-2: Describe coding system\nmouse-3: Set coding system" coding-system)))

(defvar ml-coding-system-keymap
  (ml-make-keymap [mode-line mouse-2] (lambda (event)
                                        (interactive "@e")
                                        (describe-coding-system buffer-file-coding-system))
                  [mode-line mouse-3] #'set-buffer-file-coding-system))

(defun ml-major-mode ()
  (ml-propertize mode-name
                 'help-echo (ml-major-mode-help)
                 'local-map ml-major-mode-keymap))

(defun ml-major-mode-help ()
  (format "%s\nmouse-1: Show mode menu\nmouse-2: Describe mode" mode-name))

(defvar ml-major-mode-keymap
  (ml-make-keymap [mode-line mouse-1] '(menu-item "Major Mode" nil :filter (lambda (_)
                                                                             (mouse-menu-major-mode-map)))
                  [mode-line mouse-2] #'describe-mode))

(defun ml-minor-modes ()
  (string-join (cl-loop for (mode lighter) in minor-mode-alist
                        when (and (boundp mode)
                                  (symbol-value mode)
                                  (not (string-empty-p (setq lighter (string-trim (format-mode-line lighter))))))
                        collect (ml-propertize lighter
                                               'help-echo (ml-minor-mode-help mode)
                                               'local-map (ml-minor-mode-keymap lighter)))
               " "))

(defun ml-minor-mode-help (mode)
  (let ((name (capitalize (replace-regexp-in-string "\\(-minor\\)?-mode" "" (symbol-name mode)))))
    (format "%s\nmouse-1: Show mode menu\nmouse-2: Describe mode" name)))

(defun ml-minor-mode-keymap (lighter)
  (ml-make-keymap [mode-line mouse-1] (lambda (event)
                                        (interactive "@e")
                                        (minor-mode-menu-from-indicator lighter))
                  [mode-line mouse-2] (lambda (event)
                                        (interactive "@e")
                                        (describe-minor-mode-from-indicator lighter))))

(defun ml-position ()
  (let ((space (make-space 0.33)))
    (format "%%l%s:%s%%C" space space)))

(defun ml-project ()
  (when (and projectile-mode
             (projectile-project-p))
    (ml-propertize (projectile-project-name)
                   'help-echo (ml-project-help)
                   'local-map ml-project-keymap)))

(defun ml-project-help ()
  "Projectile\nmouse-1: Show Projectile menu")

(defvar ml-project-keymap
  (ml-make-keymap [mode-line mouse-1] projectile-mode-menu))

(defun ml-status ()
  (cond (buffer-read-only
         (ml-propertize " RO "
                        'help-echo (ml-status-help)))
        ((and (buffer-modified-p)
              (buffer-file-name))
         (ml-propertize " ** "
                        'help-echo (ml-status-help)))
        (t
         "    ")))

(defun ml-status-help ()
  (if buffer-read-only
      "The buffer is read-only"
    "The buffer has been modified"))

(defun ml-syntax-checking ()
  (when (and flycheck-mode
             (flycheck-get-checker-for-buffer))
    (let-alist (flycheck-count-errors flycheck-current-errors)
      (let ((indicator (pcase flycheck-last-status-change
                         ('running "*")
                         ((or 'errored 'interrupted 'suspicious) "!")
                         (_ "-")))
            (errors (or .error 0))
            (warnings (or .warning 0))
            (infos (or .info 0)))
        (ml-propertize (if (and (eq flycheck-last-status-change 'finished)
                                (> (+ errors warnings infos) 0))
                           (format "%s|%s|%s" errors warnings infos)
                         indicator)
                       'help-echo (ml-syntax-checking-help)
                       'local-map ml-syntax-checking-keymap)))))

(defun ml-syntax-checking-help ()
  "Flycheck\nmouse-1: Show Flycheck menu")

(defvar ml-syntax-checking-keymap
  (ml-make-keymap [mode-line mouse-1] flycheck-mode-menu-map))

(setq-default mode-line-format '(:eval (let ((left `("    "
                                                     ,(ml-status)
                                                     "    "
                                                     ,(ml-buffer-name)
                                                     "    "
                                                     ,(ml-major-mode)
                                                     ,@(when (ml-active-window-p)
                                                         `("    "
                                                           ,@(when-let ((syntax-checking (ml-syntax-checking)))
                                                               `(,syntax-checking
                                                                 "  "))
                                                           ,(ml-minor-modes)))))
                                             (right `(,@(when (ml-active-window-p)
                                                          (when-let ((project (ml-project)))
                                                            `(,project
                                                              "    ")))
                                                      ,(ml-coding-system)
                                                      " | "
                                                      ,(ml-position))))
                                         `(,(ml-set-height 25)
                                           ,left
                                           ,(ml-fill (- (string-width (format-mode-line right))
                                                        1.34))
                                           ,right))))

(setq mode-line-default-help-echo nil)

(setq slime-autodoc-mode-string nil)
(diminish 'company-mode)
(diminish 'eldoc-mode)
(diminish 'flycheck-mode)
(diminish 'ivy-mode)
(diminish 'projectile-mode)
(diminish 'slime-mode)
(diminish 'smartparens-mode)
(diminish 'undo-tree-mode)
(diminish 'ws-butler-mode)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-mode-line)
