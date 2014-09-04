;; -----------------------------------------------------------------------------
;; commands --------------------------------------------------------------------

;; better flex in ido
(require 'flx-ido)
(setq ido-enable-flex-matching t
      ido-use-faces nil
      flx-ido-use-faces t)
(flx-ido-mode t)

;; vertical results in ido
(require 'ido-vertical-mode)
(ido-vertical-mode t)

;; ido everywhere
(require 'ido-ubiquitous)
(ido-ubiquitous-mode t)

;; ido in M-x
(require 'smex)
(setq smex-flex-matching t
      smex-history-length (/ ido-max-prospects 2)
      smex-save-file (concat +session-dir+ ".smex"))
(smex-initialize)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-commands)
