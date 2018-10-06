;; -----------------------------------------------------------------------------
;; programming -----------------------------------------------------------------

;; projects
(setq projectile-completion-system 'ivy
      projectile-indexing-method 'alien
      projectile-enable-caching t
      projectile-cache-file (concat +session-dir+ ".projectile.cache")
      projectile-known-projects-file (concat +session-dir+ ".projectile"))
(projectile-mode t)

;; indentation
(setq-default indent-tabs-mode nil
              tab-width 4)
(electric-indent-mode t)

;; comments
(setq comment-empty-lines t)

;; delimiters
(setq sp-show-pair-delay 0
      sp-highlight-pair-overlay nil
      sp-highlight-wrap-overlay nil
      sp-highlight-wrap-tag-overlay nil)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; completion
(setq company-backends '(company-slime
                         company-elisp
                         company-capf
                         company-files
                         (company-dabbrev-code company-dabbrev company-abbrev company-keywords))
      company-idle-delay nil
      company-quickhelp-delay +documentation-delay+
      company-tooltip-align-annotations t
      company-tooltip-minimum-width 25
      company-tooltip-limit 10)
(global-company-mode t)
(company-quickhelp-mode t)

;; documentation
(setq eldoc-idle-delay +documentation-delay+
      eldoc-echo-area-use-multiline-p t)
(global-eldoc-mode t)

;; syntax checking
(setq flycheck-checkers '()
      flycheck-check-syntax-automatically '(save idle-change)
      flycheck-idle-change-delay +auto-check-delay+
      flycheck-indication-mode 'left-fringe
      flycheck-highlighting-mode 'symbols
      flycheck-display-errors-delay +documentation-delay+)
(global-flycheck-mode t)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-programming)
