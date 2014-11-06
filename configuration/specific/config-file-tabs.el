;; -----------------------------------------------------------------------------
;; file tabs -------------------------------------------------------------------
;;
;; based on aquamacs-tabbar and tabbar-ruler

(require 'tabbar)


;; -----------------------------------------------------------------------------
;; style -----------------------------------------------------------------------

(set-face-attribute 'tabbar-default nil
                    :inherit nil
                    :family "Segoe UI"
                    :height 90
                    :width 'normal
                    :weight 'normal
                    :slant 'normal
                    :underline nil
                    :overline nil
                    :strike-through nil
;;                    :inverse-video nil ; inherit from frame
                    :foreground "black"
                    :background "grey80"
                    :box nil
                    :stipple nil)


(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :foreground "grey20"
                    :background "grey95"
                    :box '(:line-width 3 :color "grey95" :style nil))

(defface tabbar-selected-highlight '((t
                                      :inherit tabbar-selected))
  ""
  :group 'tabbar)

(defface tabbar-selected-modified '((t
                                     :inherit tabbar-selected
                                     :weight bold))
  ""
  :group 'tabbar)


(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :foreground "black"
                    :background "grey80"
                    :box '(:line-width 3 :color "grey80" :style nil))

(defface tabbar-unselected-highlight '((t
                                        :inherit tabbar-unselected
                                        :background "grey75"
                                        :box (:line-width 3 :color "grey75" :style nil)))
  ""
  :group 'tabbar)

(defface tabbar-unselected-modified '((t
                                       :inherit tabbar-unselected
                                       :weight bold))
  ""
  :group 'tabbar)


(set-face-attribute 'tabbar-button nil
                    :inherit 'tabbar-default
                    :background "grey80"
                    :box nil)

(set-face-attribute 'tabbar-button-highlight nil
                    :inherit 'tabbar-button
                    :background "grey75")


(set-face-attribute 'tabbar-separator nil
                    :inherit 'tabbar-default
                    :background "grey55"
                    :height 1.0)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(setq tabbar-buffer-home-button '(("") ""))


(defsubst tabbar-line-tab (tab)
  "Returns the display representation of a tab.
   That is, a propertized string used as an `header-line-format' template element.
   Call `tabbar-tab-label-function' to obtain a label for the tab."
  (let* ((buffer (tabbar-tab-value tab))
         (selected-p (tabbar-selected-p tab (tabbar-current-tabset)))
         (modified-p (and (not (buffer-local-value 'buffer-read-only buffer))
                          (buffer-modified-p buffer)))
         (label (if tabbar-tab-label-function
                    (funcall tabbar-tab-label-function tab)
                  tab))
         (face (if selected-p
                   (if modified-p
                       'tabbar-selected-modified
                     'tabbar-selected)
                 (if modified-p
                     'tabbar-unselected-modified
                   'tabbar-unselected)))
         (mouse-face (if selected-p
                         'tabbar-selected-highlight
                       'tabbar-unselected-highlight))
         (display-label (propertize label
                                    'tabbar-tab tab
                                    'face face
                                    'mouse-face mouse-face
                                    'pointer 'arrow
                                    'help-echo 'tabbar-help-on-tab
                                    'local-map (tabbar-make-tab-keymap tab))))
    (concat display-label tabbar-separator-value)))


(defun tabbar-line-button (button)
  "Returns the display representation of a button.
   That is, a propertized string used as an `header-line-format' template element.
   Call `tabbar-button-label-function' to obtain a label for the button."
  (let ((label (if tabbar-button-label-function
                   (funcall tabbar-button-label-function button)
                 (cons button button)))) ; (enabled . disabled)
    ;; cache the display value of the enabled/disabled buttons in variable `tabbar-NAME-button-value'
    (set (intern (format "tabbar-%s-button-value" button))
         (cons (propertize (car label) ; enabled
                           'tabbar-button button
                           'face 'tabbar-button
                           'mouse-face 'tabbar-button-highlight
                           'pointer 'arrow
                           'help-echo 'tabbar-help-on-button
                           'local-map (tabbar-make-button-keymap button))
               (propertize (cdr label) ; disabled
                           'face 'tabbar-button
                           'pointer 'arrow)))))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(defun tabbar-buffer-groups ()
  "Returns the list of groups the current buffer belongs to.
   Use the same group for all buffers."
  '("all"))


(defun tabbar-buffer-list ()
  "Returns the list of buffers to show in the tab bar.
   Exclude all buffers whose name starts with ' ' or '*'.
   Always include the current buffer."
  (remove-if '(lambda (buffer)
                (unless (eq buffer (current-buffer))
                  (find (aref (buffer-name buffer) 0) " *")))
             (buffer-list)))


(defun tabbar-help-on-tab (window object position)
  "Returns the help string shown when mouse-hovering a tab.
   Return either the file name of the file the buffer is visiting or the buffer's name."
  (with-selected-window window
    (let* ((tab (get-text-property position 'tabbar-tab object))
           (buffer (tabbar-tab-value tab))
           (file-name (buffer-file-name buffer)))
      (if file-name
          (abbreviate-file-name file-name)
        (buffer-name buffer)))))


(defun tabbar-help-on-button (window object position)
  "Returns the help string shown when mouse-hovering a button.
   No help available."
  (with-selected-window window
    nil))


(defun tabbar-update (&rest args)
  "Updates the tab bar."
  (tabbar-set-template tabbar-current-tabset nil)
  (tabbar-display-update))


;; update the tab bar whenever the current buffer is modified or saved
(add-hook 'after-change-functions 'tabbar-update t)
(add-hook 'after-save-hook 'tabbar-update t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(tabbar-mode t)
(tabbar-mwheel-mode -1)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-file-tabs)
