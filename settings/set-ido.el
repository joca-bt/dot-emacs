;; -----------------------------------------------------------------------------
;; ido -------------------------------------------------------------------------

;; ido
(setq ido-enable-flex-matching t
      ido-enable-prefix nil
      ido-enable-regexp nil
      ido-case-fold t
      ido-enable-dot-prefix nil
      ido-use-filename-at-point nil
      ido-use-url-at-point nil
      ido-max-prospects 10
      ido-buffer-disable-smart-matches t
      ido-auto-merge-work-directories-length -1
      ido-show-dot-for-dired t
      ido-confirm-unique-completion t
      ido-save-directory-list-file (concat +session-dir+ ".ido"))
(ido-mode t)
(ido-everywhere t)

;; ido everywhere
(ido-ubiquitous-mode t)

;; ido in M-x
(setq smex-history-length (/ ido-max-prospects 2)
      smex-save-file (concat +session-dir+ ".smex"))
(smex-initialize)

;; better flex in ido
(setq ido-use-faces nil
      flx-ido-use-faces t)
(flx-ido-mode t)

;; vertical results in ido
(ido-vertical-mode t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-ido)
