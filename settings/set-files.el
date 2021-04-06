;; -----------------------------------------------------------------------------
;; files -----------------------------------------------------------------------

(defun recentf-find-file ()
  (interactive)
  (ivy-read "[recentf] Find file: "
            recentf-list
            :action #'find-file
            :require-match t))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

;; coding system
(prefer-coding-system 'utf-8-unix)

;; disable file locks
(setq create-lockfiles nil)

;; name buffers uniquely
(setq uniquify-buffer-name-style 'post-forward)

;; mouse buffer list
(setq mouse-buffer-menu-maxlen 20
      mouse-buffer-menu-mode-mult 10)

;; recent files list
(setq recentf-max-menu-items 20
      recentf-max-saved-items +file-history-size+
      recentf-save-file (concat +session-dir+ ".recentf"))
(recentf-mode t)
(add-hook 'window-buffer-change-functions (lambda (_) (recentf-track-opened-file)))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-files)
