;; -----------------------------------------------------------------------------
;; programming -----------------------------------------------------------------

;; completion
(require 'company)
(setq company-idle-delay nil
      company-tooltip-limit 10
      company-tooltip-minimum-width 25
      company-selection-wrap-around t)
(global-company-mode t)

;; documentation
(require 'eldoc)
(setq eldoc-echo-area-use-multiline-p t
      eldoc-idle-delay +documentation-delay+)

;; indentation
(require 'electric)
(electric-indent-mode t)

;; delimiter pairing, matching, and highlighting
(require 'smartparens-config)
(setq sp-autoinsert-pair t
      sp-autowrap-region t
      sp-highlight-pair-overlay nil
      sp-show-pair-delay 0)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; dimmer parentheses
;;(require 'parenface)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-programming) 
