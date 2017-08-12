;; -----------------------------------------------------------------------------
;; key bindings ----------------------------------------------------------------

(defmacro ifn (&rest body)
  `(lambda ()
     (interactive)
     ,@body))

;; set hyper key
(setq w32-apps-modifier 'hyper)

;; unset mouse keys
(global-unset-key [mouse-2])
(global-unset-key [mouse-3])


;; -----------------------------------------------------------------------------
;; ivy -------------------------------------------------------------------------

(define-key ivy-minibuffer-map (kbd "C-s") #'ivy-next-line)
(define-key ivy-minibuffer-map (kbd "C-r") #'ivy-previous-line)
(define-key ivy-minibuffer-map (kbd "<next>") #'ivy-scroll-up-command)
(define-key ivy-minibuffer-map (kbd "<prior>") #'ivy-scroll-down-command)
(define-key ivy-minibuffer-map (kbd "RET") #'ivy-alt-done)
(define-key ivy-minibuffer-map (kbd "C-j") #'ivy-immediate-done)


;; -----------------------------------------------------------------------------
;; s-expressions ---------------------------------------------------------------

(define-key smartparens-mode-map (kbd "M-d") #'sp-forward-sexp) ; move sexp →
(define-key smartparens-mode-map (kbd "M-a") #'sp-backward-sexp) ; move sexp ←
(define-key smartparens-mode-map (kbd "M-s") #'sp-down-sexp) ; move sexp ↓ →
(define-key smartparens-mode-map (kbd "M-w") #'sp-backward-up-sexp) ; move sexp ↑ ←
(define-key smartparens-mode-map (kbd "M-S") #'sp-backward-down-sexp) ; move sexp ↓ ←
(define-key smartparens-mode-map (kbd "M-W") #'sp-up-sexp) ; move sexp ↑ →

(define-key smartparens-mode-map (kbd "M-q") #'sp-beginning-of-sexp) ; move to start of sexp
(define-key smartparens-mode-map (kbd "M-e") #'sp-end-of-sexp) ; move to end of sexp
(global-set-key (kbd "M-Q") #'beginning-of-defun) ; move to start of function
(global-set-key (kbd "M-E") #'end-of-defun) ; move to end of function

(define-key smartparens-mode-map (kbd "H-s") #'sp-split-sexp) ; split sexp
(define-key smartparens-mode-map (kbd "H-j") #'sp-join-sexp) ; join sexp

(define-key smartparens-mode-map (kbd "H-d") #'sp-forward-slurp-sexp) ; forward slurp sexp
(define-key smartparens-mode-map (kbd "H-D") #'sp-forward-barf-sexp) ; forward barf sexp
(define-key smartparens-mode-map (kbd "H-a") #'sp-backward-slurp-sexp) ; backward slurp sexp
(define-key smartparens-mode-map (kbd "H-A") #'sp-backward-barf-sexp) ; backward barf sexp
(define-key smartparens-mode-map (kbd "H-w") #'sp-raise-sexp) ; raise sexp
(define-key smartparens-mode-map (kbd "H-W") #'sp-splice-sexp-killing-backward) ; backward splice sexp

(define-key smartparens-mode-map (kbd "M-(") (ifn (sp-wrap-with-pair "("))) ; wrap sexp with ()
(define-key smartparens-mode-map (kbd "M-[") (ifn (sp-wrap-with-pair "["))) ; wrap sexp with []
(define-key smartparens-mode-map (kbd "M-{") (ifn (sp-wrap-with-pair "{"))) ; wrap sexp with {}
(define-key smartparens-mode-map (kbd "M-\"") (ifn (sp-wrap-with-pair "\""))) ; wrap sexp with ""
(define-key smartparens-mode-map (kbd "H-u") #'sp-unwrap-sexp) ; unwrap sexp


;; -----------------------------------------------------------------------------
;; windows ---------------------------------------------------------------------

(global-set-key (kbd "M-\\") #'delete-window) ; close current window
(global-set-key (kbd "M-1") #'delete-other-windows) ; close all other windows
(global-set-key (kbd "M-2") #'split-window-vertically) ; split window vertically
(global-set-key (kbd "M-3") #'split-window-horizontally) ; split window horizontally

(global-set-key (kbd "M-S-<right>") #'windmove-right) ; move window →
(global-set-key (kbd "M-S-<left>") #'windmove-left) ; move window ←
(global-set-key (kbd "M-S-<down>") #'windmove-down) ; move window ↓
(global-set-key (kbd "M-S-<up>") #'windmove-up) ; move window ↑


;; -----------------------------------------------------------------------------
;; rest ------------------------------------------------------------------------

(global-set-key (kbd "M-x") #'smex) ; execute command
(global-set-key (kbd "M-X") #'smex-major-mode-commands) ; execute major-mode-relevant command

(global-set-key (kbd "M-<down>") #'tabbar-forward) ; switch to next file tab
(global-set-key (kbd "M-<up>") #'tabbar-backward) ; switch to previous file tab

(global-set-key (kbd "C-<down>") #'scroll-up-line) ; scroll line ↓
(global-set-key (kbd "C-<up>") #'scroll-down-line) ; scroll line ↑

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

(global-set-key (kbd "M-z") #'avy-goto-char-timer) ; avy

(global-set-key (kbd "C-<SPC>") #'company-complete) ; auto-complete


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-key-bindings)
