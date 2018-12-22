;; -----------------------------------------------------------------------------
;; file tabs -------------------------------------------------------------------

(face-spec-set 'tabbar-default `((t ,@+ui-font+
                                    :foreground "black"
                                    :background "grey80"))
               'face-defface-spec)

(face-spec-set 'tabbar-selected '((t :inherit tabbar-default
                                     :foreground "grey15"
                                     :background "grey95"
                                     :box (:line-width 3 :color "grey95")))
               'face-defface-spec)

(defface tabbar-selected-highlight '((t :inherit tabbar-selected))
  "")

(face-spec-set 'tabbar-selected-modified '((t :inherit tabbar-selected
                                              :weight bold))
               'face-defface-spec)

(face-spec-set 'tabbar-unselected '((t :inherit tabbar-default
                                       :foreground "black"
                                       :background "grey80"
                                       :box (:line-width 3 :color "grey80")))
               'face-defface-spec)

(defface tabbar-unselected-highlight '((t :inherit tabbar-unselected
                                          :background "grey65"
                                          :box (:line-width 3 :color "grey65")))
  "")

(defface tabbar-unselected-modified '((t :inherit tabbar-unselected
                                         :weight bold))
  "")

(face-spec-set 'tabbar-button '((t :inherit tabbar-unselected
                                   :box nil))
               'face-defface-spec)

(face-spec-set 'tabbar-button-highlight '((t :inherit tabbar-unselected-highlight
                                             :box nil))
               'face-defface-spec)

(face-spec-set 'tabbar-separator '((t :inherit tabbar-default
                                      :background "grey50"))
               'face-defface-spec)

(defun tabbar-buffer-list ()
  (cl-remove-if #'(lambda (buffer)
                    (unless (or (eq buffer (current-buffer))
                                (buffer-file-name buffer))
                      (cl-find (aref (buffer-name buffer) 0) " *")))
                (buffer-list)))

(defun tabbar-line-tab (tab)
  (let* ((buffer (tabbar-tab-value tab))
         (selected-p (tabbar-selected-p tab (tabbar-current-tabset)))
         (modified-p (and (buffer-file-name buffer)
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
                       'tabbar-unselected-highlight)))
    (concat (propertize label
                        'tabbar-tab tab
                        'face face
                        'mouse-face mouse-face
                        'pointer 'arrow
                        'help-echo #'tabbar-line-tab-help
                        'local-map (tabbar-make-tab-keymap tab))
            tabbar-separator-value)))

(defun tabbar-line-tab-help (window object position)
  (with-selected-window window
    (let* ((tab (get-text-property position 'tabbar-tab object))
           (buffer (tabbar-tab-value tab))
           (file-name (buffer-file-name buffer)))
      (if file-name
          (abbreviate-file-name file-name)
        (buffer-name buffer)))))

(defun tabbar-line-button (button)
  (let ((label (if tabbar-button-label-function
                   (funcall tabbar-button-label-function button)
                 (cons button button))))
    (set (intern (format "tabbar-%s-button-value" button))
         (cons (propertize (car label)
                           'tabbar-button button
                           'face 'tabbar-button
                           'mouse-face 'tabbar-button-highlight
                           'pointer 'arrow
                           'local-map (tabbar-make-button-keymap button))
               (propertize (cdr label)
                           'face 'tabbar-button
                           'pointer 'arrow)))))

(defun tabbar-update (&rest args)
  (tabbar-set-template (tabbar-current-tabset) nil)
  (tabbar-display-update))

(setq tabbar-buffer-home-button '(("") "")
      tabbar-buffer-groups-function nil
      tabbar-separator '(0.2))
(tabbar-mode t)
(tabbar-mwheel-mode -1)
(add-hook 'after-change-functions #'tabbar-update t)
(add-hook 'after-save-hook #'tabbar-update t)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-file-tabs)
