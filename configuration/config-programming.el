;; -----------------------------------------------------------------------------
;; programming -----------------------------------------------------------------

;; style
(setq-default indent-tabs-mode t
              tab-width 4)
(electric-indent-mode t)

;; delimiter pairing, matching, and highlighting
(setq sp-autoinsert-pair t
      sp-autowrap-region t
      sp-highlight-pair-overlay nil
      sp-show-pair-delay 0)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; completion
(setq company-idle-delay nil
      company-tooltip-limit 10
      company-tooltip-minimum-width 25
      company-selection-wrap-around t)
(global-company-mode t)

;; documentation
(setq doxymacs-doxygen-style "JavaDoc"
      eldoc-idle-delay +documentation-delay+
      eldoc-echo-area-use-multiline-p t)

;; syntax checking
(setq flycheck-check-syntax-automatically '(save idle-change)
      flycheck-idle-change-delay +auto-check-delay+
      flycheck-completion-system 'ido
      flycheck-indication-mode 'left-fringe
      flycheck-highlighting-mode 'sexps
      flycheck-display-errors-delay +error-delay+)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-programming)
