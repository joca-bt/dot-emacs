;; -----------------------------------------------------------------------------
;; programming -----------------------------------------------------------------

(defun ivy-xref-show-xrefs (xrefs alist)
  (let ((xrefs (cl-loop for (file-name . xrefs) in (xref--analyze xrefs)
                        nconc (mapcar (lambda (xref)
                                        (list (format "%s: %s"
                                                      (propertize (file-name-nondirectory file-name) 'face 'compilation-info)
                                                      (xref-item-summary xref))
                                              (xref-item-location xref)))
                                      xrefs)))
        (windows (count-windows)))
    (setq xref--original-window (assoc-default 'window alist)
          xref--original-window-intent (assoc-default 'display-action alist))
    (ivy-read "xref: "
              xrefs
              :action (lambda (candidate)
                        (xref--show-location (cadr candidate) t)
                        (when (= windows 1)
                          (delete-window xref--original-window)))
              :require-match t)))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

;; projects
(setq projectile-completion-system 'ivy
      projectile-indexing-method 'alien
      projectile-enable-caching nil
      projectile-known-projects-file (concat +session-dir+ ".projectile"))
(projectile-mode t)

;; references
(setq xref-show-xrefs-function #'ivy-xref-show-xrefs
      xref-after-jump-hook '(recenter)
      xref-after-return-hook nil)

;; completion
(setq company-backends '(;; lisp
                         company-slime
                         company-elisp
                         ;; rest
                         company-capf
                         (company-dabbrev-code company-dabbrev company-keywords))
      company-idle-delay nil
      company-quickhelp-delay +documentation-delay+
      company-tooltip-align-annotations t
      company-tooltip-minimum 5
      company-tooltip-limit 10
      company-tooltip-minimum-width 30
      company-quickhelp-use-propertized-text t
      company-quickhelp-max-lines 20
      ;; backends
      company-dabbrev-downcase nil
      company-dabbrev-ignore-case nil
      company-dabbrev-other-buffers t)
(global-company-mode t)
(company-quickhelp-mode t)

;; documentation
(setq eldoc-idle-delay +documentation-delay+
      eldoc-echo-area-use-multiline-p t)
(global-eldoc-mode t)

;; syntax checking
(setq flycheck-checkers '()
      flycheck-check-syntax-automatically '(mode-enabled save)
      flycheck-indication-mode nil
      flycheck-highlighting-mode 'symbols
      flycheck-display-errors-delay +documentation-delay+
      flycheck-pos-tip-timeout -1)
(global-flycheck-mode t)
(flycheck-pos-tip-mode t)

;; comments
(setq comment-empty-lines t)

;; indentation
(setq-default indent-tabs-mode nil
              tab-width 4)
(electric-indent-mode t)

;; delimiters
(setq sp-show-pair-delay 0
      sp-highlight-pair-overlay nil
      sp-highlight-wrap-overlay nil
      sp-highlight-wrap-tag-overlay nil)
(smartparens-global-mode t)
(show-smartparens-global-mode t)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-programming)
