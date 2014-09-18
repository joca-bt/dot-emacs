;; -----------------------------------------------------------------------------
;; programming -----------------------------------------------------------------

;; completion
(require 'auto-complete-config)
(setq ac-auto-start nil
      ac-use-fuzzy t
      ac-ignore-case 'smart
      ac-dwim nil
      ac-show-menu-immediately-on-auto-complete t
      ac-expand-on-auto-complete t
      ac-use-menu-map t
      ac-use-quick-help t
      ac-quick-help-delay 1
      ac-menu-height 10
      ac-quick-help-height 20
      ac-use-comphist t
      ac-comphist-file (concat +session-dir+ ".auto-completion"))
(define-key ac-menu-map (kbd "S-<tab>") 'ac-previous)
(global-auto-complete-mode t)

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


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-programming) 
