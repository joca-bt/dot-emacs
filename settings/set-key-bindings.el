;; -----------------------------------------------------------------------------
;; key bindings ----------------------------------------------------------------

(defmacro ifn (&rest body)
  `(lambda ()
     (interactive)
     ,@body))

;; set hyper key
(when +windows-p+
  (setq w32-apps-modifier 'hyper))

;; -----------------------------------------------------------------------------
;; unset -----------------------------------------------------------------------

(global-unset-key (kbd "<insert>"))
(global-unset-key (kbd "<mouse-2>"))
(global-unset-key (kbd "<mouse-3>"))
(global-unset-key (kbd "C-<wheel-down>"))
(global-unset-key (kbd "C-<wheel-up>"))

;; -----------------------------------------------------------------------------
;; company ---------------------------------------------------------------------

(global-set-key (kbd "C-<SPC>") #'company-complete)
(define-key company-active-map (kbd "M-.") #'company-show-location)
(define-key company-active-map (kbd "C-s") #'company-select-next)
(define-key company-active-map (kbd "C-r") #'company-select-previous)

;; -----------------------------------------------------------------------------
;; ivy -------------------------------------------------------------------------

(define-key ivy-minibuffer-map (kbd "<RET>") #'ivy-alt-done)
(define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)
(define-key ivy-minibuffer-map (kbd "C-s") #'ivy-next-line)
(define-key ivy-minibuffer-map (kbd "C-r") #'ivy-previous-line)

;; -----------------------------------------------------------------------------
;; smartparens -----------------------------------------------------------------

(define-key smartparens-mode-map (kbd "M-Q") #'beginning-of-defun) ; move to start of function
(define-key smartparens-mode-map (kbd "M-E") #'end-of-defun) ; move to end of function
(define-key smartparens-mode-map (kbd "M-q") #'sp-beginning-of-sexp) ; move to start of sexp
(define-key smartparens-mode-map (kbd "M-e") #'sp-end-of-sexp) ; move to end of sexp

(define-key smartparens-mode-map (kbd "M-d") #'sp-forward-sexp) ; move sexp →
(define-key smartparens-mode-map (kbd "M-a") #'sp-backward-sexp) ; move sexp ←
(define-key smartparens-mode-map (kbd "M-s") #'sp-down-sexp) ; move sexp ↓ →
(define-key smartparens-mode-map (kbd "M-w") #'sp-backward-up-sexp) ; move sexp ↑ ←

(define-key smartparens-mode-map (kbd "H-w") #'sp-raise-sexp) ; raise sexp

(define-key smartparens-mode-map (kbd "M-\"") (ifn (sp-wrap-with-pair "\""))) ; wrap sexp with ""
(define-key smartparens-mode-map (kbd "M-(") (ifn (sp-wrap-with-pair "("))) ; wrap sexp with ()
(define-key smartparens-mode-map (kbd "M-[") (ifn (sp-wrap-with-pair "["))) ; wrap sexp with []
(define-key smartparens-mode-map (kbd "M-{") (ifn (sp-wrap-with-pair "{"))) ; wrap sexp with {}
(define-key smartparens-mode-map (kbd "H-u") #'sp-unwrap-sexp) ; unwrap sexp

;; -----------------------------------------------------------------------------
;; other -----------------------------------------------------------------------

(global-set-key (kbd "M-\\") #'delete-window) ; close current window
(global-set-key (kbd "M-1") #'delete-other-windows) ; close all other windows
(global-set-key (kbd "M-2") #'split-window-vertically) ; split window vertically
(global-set-key (kbd "M-3") #'split-window-horizontally) ; split window horizontally
(global-set-key (kbd "M-4") #'balance-windows) ; balance windows
(global-set-key (kbd "M-5") #'window-swap-states) ; transpose windows

(global-set-key (kbd "M-S-<right>") #'windmove-right) ; move window →
(global-set-key (kbd "M-S-<left>") #'windmove-left) ; move window ←
(global-set-key (kbd "M-S-<down>") #'windmove-down) ; move window ↓
(global-set-key (kbd "M-S-<up>") #'windmove-up) ; move window ↑

(global-set-key (kbd "M-<down>") #'tabbar-forward) ; move file tab →
(global-set-key (kbd "M-<up>") #'tabbar-backward) ; move file tab ←

(global-set-key (kbd "C-<down>") #'scroll-up-line) ; scroll window ↓
(global-set-key (kbd "C-<up>") #'scroll-down-line) ; scroll window ↑

(global-set-key (kbd "C-x C-f") #'find-file) ; find file
(global-set-key (kbd "C-x C-r") #'recentf-find-file) ; find file in recent files
(global-set-key (kbd "C-x C-p") #'projectile-find-file) ; find file in project
(global-set-key (kbd "C-x C-b") #'switch-to-buffer) ; switch to buffer

(global-set-key (kbd "H-f") #'find-file) ; find file
(global-set-key (kbd "H-r") #'recentf-find-file) ; find file in recent files
(global-set-key (kbd "H-p") #'projectile-find-file) ; find file in project
(global-set-key (kbd "H-b") #'switch-to-buffer) ; switch to buffer

(global-set-key (kbd "C-w") #'kill-this-buffer) ; close current buffer
(global-set-key (kbd "C-a") #'mark-whole-buffer) ; select all
(global-set-key (kbd "C-z") #'undo-tree-undo) ; undo
(global-set-key (kbd "C-y") #'undo-tree-redo) ; redo

(global-set-key (kbd "C-e") #'er/expand-region) ; expand region
(global-set-key (kbd "C-S-e") #'er/contract-region) ; contract region
(global-set-key (kbd "M-c") #'mc/mark-all-dwim) ; multiple cursors

;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-key-bindings)
