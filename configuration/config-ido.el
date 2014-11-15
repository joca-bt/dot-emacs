;; -----------------------------------------------------------------------------
;; ido -------------------------------------------------------------------------

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

;; ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode t)

;; ido in M-x
(require 'smex)
(setq smex-flex-matching t
      smex-history-length (/ ido-max-prospects 2)
      smex-save-file (concat +session-dir+ ".smex"))
(smex-initialize)

;; better flex in ido
(require 'flx-ido)
(setq ido-enable-flex-matching t
      ido-use-faces nil
      flx-ido-use-faces t)
(flx-ido-mode t)

;; vertical results in ido
(require 'ido-vertical-mode)
(ido-vertical-mode t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-ido)
