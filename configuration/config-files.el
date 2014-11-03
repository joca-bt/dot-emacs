;; -----------------------------------------------------------------------------
;; files and buffers -----------------------------------------------------------

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

;; push the current buffer to the top of the recent files list
(defun recentf-push-current-buffer ()
  (let ((file-name (buffer-file-name (current-buffer))))
    (when file-name
      (recentf-add-file file-name))))
(add-to-list 'window-configuration-change-hook 'recentf-push-current-buffer)

;; ido
(require 'ido)
(setq ido-everywhere t
      ido-enable-flex-matching t
      ido-enable-regexp nil
      ido-case-fold t
      ido-enable-prefix nil
      ido-enable-dot-prefix nil
      ido-use-filename-at-point nil
      ido-use-url-at-point nil
      ido-max-prospects 10
      ido-buffer-disable-smart-matches t
      ido-auto-merge-work-directories-length -1
      ido-show-dot-for-dired t
      ido-confirm-unique-completion t
      ido-enable-last-directory-history t
      ido-max-work-directory-list 20
      ido-max-work-file-list 50
      ido-save-directory-list-file (concat +session-dir+ ".ido"))
(ido-mode 'both)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-files)
