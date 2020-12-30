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
  (eq (selected-window)
      ml-active-window))

(defun ml-set-active-window ()
  (let ((window (selected-window)))
    (unless (minibuffer-window-active-p window)
      (setq ml-active-window window))))

(add-hook 'window-selection-change-functions (lambda (_) (ml-set-active-window)))

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
                      (1 "win")
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
  (ml-make-keymap [mode-line mouse-1] '(menu-item "Major Mode" nil :filter (lambda (_) (mouse-menu-major-mode-map)))
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

(let ((space (make-space 0.33)))
  (defun ml-position ()
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

(setq-default mode-line-format '(:eval (let ((left `("    "
                                                     ,(if (ml-active-window-p)
                                                          (ml-status)
                                                        "    ")
                                                     "    "
                                                     ,(ml-buffer-name)
                                                     "    "
                                                     ,(ml-major-mode)
                                                     ,@(when (ml-active-window-p)
                                                         `("    "
                                                           ,(ml-minor-modes)))))
                                             (right (when (ml-active-window-p)
                                                      `(,@(when-let ((project (ml-project)))
                                                            `(,project
                                                              "    "))
                                                        ,(ml-coding-system)
                                                        " | "
                                                        ,(ml-position)))))
                                         `(,(ml-set-height 25)
                                           ,left
                                           ,(ml-fill (- (string-width (format-mode-line right))
                                                        1.34))
                                           ,right))))

(setq mode-line-default-help-echo nil)

;; company-mode
(setq company-lighter nil)
;; eldoc-mode
(setq eldoc-minor-mode-string nil)
;; ivy-mode
(diminish 'ivy-mode)
;; projectile-mode
(setq-default projectile--mode-line nil)
(setq         projectile-dynamic-mode-line nil)
;; slime-autodoc-mode
(setq slime-autodoc-mode-string nil)
;; smartparens-mode
(diminish 'smartparens-mode)
;; undo-tree-mode
(setq undo-tree-mode-lighter nil)
;; ws-butler-mode
(diminish 'ws-butler-mode)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-mode-line)
