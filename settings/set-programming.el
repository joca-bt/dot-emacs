;; -----------------------------------------------------------------------------
;; programming -----------------------------------------------------------------

(defun xref-show-definitions (fetcher alist)
  (let ((xrefs (cl-loop for (file-name . xrefs) in (xref--analyze (funcall fetcher))
                        nconc (mapcar (lambda (xref)
                                        (list (format "%s: %s"
						                              (propertize (file-name-nondirectory file-name) 'face 'xref-file-header)
						                              (xref-item-summary xref))
					                          xref))
				                      xrefs))))
    (if (not (cdr xrefs))
	    (xref-pop-to-location (cadar xrefs))
      (ivy-read "xref: "
		        xrefs
		        :action (lambda (candidate)
			              (xref-pop-to-location (cadr candidate)))
		        :require-match t))))

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

;; projects
(setq projectile-completion-system 'ivy
      projectile-indexing-method 'alien
      projectile-enable-caching nil
      projectile-known-projects-file (concat +session-dir+ ".projectile"))
(projectile-mode t)

;; references
(setq xref-show-definitions-function #'xref-show-definitions
      xref-after-jump-hook '(recenter)
      xref-after-return-hook nil)

;; completion
(setq company-backends '(company-capf
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

;; comments
(setq comment-empty-lines t)

;; indentation
(setq-default indent-tabs-mode nil
              tab-width 4)

;; delimiters
(setq sp-highlight-pair-overlay nil
      sp-highlight-wrap-overlay nil
      sp-highlight-wrap-tag-overlay nil)
(smartparens-global-mode t)
(show-smartparens-global-mode t)
(require 'smartparens-config)

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-programming)
