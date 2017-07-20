;; -----------------------------------------------------------------------------
;; files and buffers -----------------------------------------------------------

;; name buffers uniquely
(setq uniquify-buffer-name-style 'post-forward)

;; mouse buffer list
(setq mouse-buffer-menu-maxlen 20
      mouse-buffer-menu-mode-mult 5)

;; recent files list
(setq recentf-max-menu-items 20
      recentf-max-saved-items +history-size+
      recentf-save-file (concat +session-dir+ ".rf"))
(recentf-mode t)

(defun recentf-push-to-top ()
  (let ((file-name (buffer-file-name)))
    (when file-name
      (recentf-add-file file-name))))

(add-hook 'window-configuration-change-hook #'recentf-push-to-top t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-files-and-buffers)
