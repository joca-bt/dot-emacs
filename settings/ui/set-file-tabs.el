;; -------------------------------------------------- -*- lexical-binding: t -*-
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
  '(""))

(let ((separator-selected (make-xpm 30 1 (face-attribute 'tabbar-separator :background)))
      (separator-unselected (make-space 0.1 'tabbar-separator)))
  (defun tabbar-line-tab (tab)
    (let* ((selected-p (tabbar-selected-p tab tabbar-current-tabset))
           (face (if selected-p
                     'tabbar-selected
                   'tabbar-unselected))
           (mouse-face (if selected-p
                           'tabbar-selected-highlight
                         'tabbar-unselected-highlight)))
      (concat (propertize (format "%s%s%s"
                                  (make-space 1)
                                  (tabbar-buffer-tab-label tab)
                                  (make-space 1))
                          'tabbar-tab tab
                          'face face
                          'mouse-face mouse-face
                          'pointer 'arrow
                          'help-echo #'tabbar-line-tab-help
                          'local-map (tabbar-make-tab-keymap tab))
              (if selected-p
                  separator-selected
                separator-unselected)))))

(defun tabbar-line-tab-help (window object position)
  (with-selected-window window
    (let* ((tab (get-text-property position 'tabbar-tab object))
           (buffer (tabbar-tab-value tab))
           (file-name (buffer-file-name buffer)))
      (if file-name
          (abbreviate-file-name file-name)
        (buffer-name buffer)))))

(defun tabbar-update (&rest args)
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))

(setq tabbar-buffer-groups-function nil)
(tabbar-mode t)
(tabbar-mwheel-mode -1)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-file-tabs)
