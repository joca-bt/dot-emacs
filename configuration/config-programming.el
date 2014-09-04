;; -----------------------------------------------------------------------------
;; programming -----------------------------------------------------------------

;; auto-completion
(require 'auto-complete)
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

;; automatic indentation
(require 'electric)
(electric-indent-mode t)

;; delimiter pairing
(require 'autopair)
(setq autopair-autowrap t
      autopair-blink nil)
(autopair-global-mode t)

;; delimiter matching and highlighting
(require 'mic-paren)
(setq paren-highlight-offscreen t
      paren-display-message 'only
      paren-delay nil
      paren-priority 'close)
(paren-activate)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-programming)
