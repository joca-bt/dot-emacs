;; -----------------------------------------------------------------------------
;; file tabs -------------------------------------------------------------------

(defface tabbar-selected-highlight '((t))
  "")

(defface tabbar-unselected-highlight '((t))
  "")

(defun tabbar-buffer-list ()
  (cl-remove-if (lambda (buffer)
                  (unless (or (eq buffer (current-buffer))
                              (buffer-file-name buffer))
                    (cl-find (aref (buffer-name buffer) 0) " *")))
                (buffer-list)))

(defun tabbar-line-buttons (tabset)
  (list ""))

(defun tabbar-line-tab (tab)
  (let* ((buffer (tabbar-tab-value tab))
         (selected-p (tabbar-selected-p tab (tabbar-current-tabset)))
         (label (if tabbar-tab-label-function
                    (funcall tabbar-tab-label-function tab)
                  tab))
         (face (if selected-p
                   'tabbar-selected
                 'tabbar-unselected))
         (mouse-face (if selected-p
                         'tabbar-selected-highlight
                       'tabbar-unselected-highlight)))
    (concat (propertize (format "%s%s%s" (make-space 1) label (make-space 1))
                        'tabbar-tab tab
                        'face face
                        'mouse-face mouse-face
                        'pointer 'arrow
                        'help-echo #'tabbar-line-tab-help
                        'local-map (tabbar-make-tab-keymap tab))
            (if selected-p
                (make-xpm 30 1 (face-attribute 'tabbar-separator :background))
              tabbar-separator-value))))

(defun tabbar-line-tab-help (window object position)
  (with-selected-window window
    (let* ((tab (get-text-property position 'tabbar-tab object))
           (buffer (tabbar-tab-value tab))
           (file-name (buffer-file-name buffer)))
      (if file-name
          (abbreviate-file-name file-name)
        (buffer-name buffer)))))

(defun tabbar-update (&rest args)
  (tabbar-set-template (tabbar-current-tabset) nil)
  (tabbar-display-update))

(setq tabbar-buffer-groups-function nil
      tabbar-separator '(0.1))
(tabbar-mode t)
(tabbar-mwheel-mode -1)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-file-tabs)
