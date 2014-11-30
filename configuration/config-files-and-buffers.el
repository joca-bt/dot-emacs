;; -----------------------------------------------------------------------------
;; files and buffers -----------------------------------------------------------

;; file locks
(setq create-lockfiles nil)

;; name buffers uniquely
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward
      uniquify-after-kill-buffer-p t)

;; mouse buffer list
(setq mouse-buffer-menu-maxlen 20
      mouse-buffer-menu-mode-mult 5)

;; recent files list
(require 'recentf)
(setq recentf-menu-title "Recent Files"
      recentf-show-file-shortcuts-flag t
      recentf-menu-open-all-flag t
      recentf-max-menu-items 20
      recentf-max-saved-items 50
      recentf-auto-cleanup 'mode
      recentf-save-file (concat +session-dir+ ".recent-files"))
(recentf-mode t)

(defun recentf-push-current-buffer ()
  "Pushes the current buffer to the top of the recent files list."
  (let ((file-name (buffer-file-name (current-buffer))))
    (when file-name
      (recentf-add-file file-name))))

(add-hook 'window-configuration-change-hook 'recentf-push-current-buffer t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-files-and-buffers)
