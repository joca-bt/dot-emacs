;; -----------------------------------------------------------------------------
;; programming -----------------------------------------------------------------

;; completion
(setq company-idle-delay nil
      company-tooltip-limit 10
      company-tooltip-minimum-width 25
      company-selection-wrap-around t)
(global-company-mode t)

;; documentation
(setq eldoc-echo-area-use-multiline-p t
      eldoc-idle-delay +documentation-delay+)

;; indentation
(electric-indent-mode t)

;; delimiter pairing, matching, and highlighting
(setq sp-autoinsert-pair t
      sp-autowrap-region t
      sp-highlight-pair-overlay nil
      sp-show-pair-delay 0)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; syntax checking
(setq flycheck-check-syntax-automatically '(save idle-change)
      flycheck-idle-change-delay +auto-check-delay+
      flycheck-completion-system 'ido
      flycheck-indication-mode 'left-fringe
      flycheck-highlighting-mode 'sexps
      flycheck-display-errors-delay +error-delay+)
(global-flycheck-mode -1)

(put 'error 'flycheck-fringe-bitmap 'filled-circle)
(put 'warning 'flycheck-fringe-bitmap 'filled-circle)
(put 'info 'flycheck-fringe-bitmap 'filled-circle)

(set-face-underline 'flycheck-error (-replace 'wave 'line (face-attribute 'flycheck-error :underline)))
(set-face-underline 'flycheck-warning (-replace 'wave 'line (face-attribute 'flycheck-warning :underline)))
(set-face-underline 'flycheck-info (-replace 'wave 'line (face-attribute 'flycheck-info :underline)))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-programming)
