;; -----------------------------------------------------------------------------
;; key bindings ----------------------------------------------------------------
;;
;; organization:
;;   help, commands
;;   files and buffers, windows
;;   search and replace, navigation
;;   selecting, editing
;;   programming

;; region-local key bindings
(require 'region-bindings-mode)
(region-bindings-mode-enable)

;; key chords
(require 'key-chord)
(key-chord-mode t)

;; set super and hyper keys
(setq w32-pass-lwindow-to-system t
      w32-pass-rwindow-to-system t
      w32-pass-apps-to-system t
;;      w32-lwindow-modifier 'super
;;      w32-rwindow-modifier 'super
      w32-apps-modifier 'hyper)

;; unset mouse keys
(global-unset-key [mouse-2])
(global-unset-key [mouse-3])


;; -----------------------------------------------------------------------------
;; help ------------------------------------------------------------------------

(global-set-key (kbd "C-h b") 'describe-bindings) ; show all active key bindings
(global-set-key (kbd "C-h k") 'describe-key) ; key binding -> command
(global-set-key (kbd "C-h w") 'where-is) ; command -> key binding(s)

(global-set-key (kbd "C-h m") 'describe-mode) ; show all active modes

(global-set-key (kbd "C-h f") 'describe-function) ; show function documentation
(global-set-key (kbd "C-h v") 'describe-variable) ; show variable documentation


;; -----------------------------------------------------------------------------
;; commands --------------------------------------------------------------------

(global-set-key (kbd "C-x C-c") 'save-buffers-kill-terminal) ; quit Emacs

(global-set-key (kbd "C-g") 'keyboard-quit) ; abort/quit
(global-set-key (kbd "M-g M-g") 'keyboard-quit) ; abort/quit

(global-set-key (kbd "M-:") 'eval-expression) ; evaluate expression

(global-set-key (kbd "M-x") 'smex) ; execute command
(global-set-key (kbd "M-X") 'smex-major-mode-commands) ; execute major-mode-relevant command


;; -----------------------------------------------------------------------------
;; files and buffers -----------------------------------------------------------

(global-set-key (kbd "C-x C-s") 'save-buffer) ; save buffer
(global-set-key (kbd "C-w") 'kill-this-buffer) ; close buffer

(global-set-key (kbd "C-x C-r") 'recentf-open-files) ; recent files list
(global-set-key (kbd "<f8>") 'neotree-toggle) ; file browser

(global-set-key (kbd "M-<down>") 'tabbar-forward) ; switch to next file tab
(global-set-key (kbd "M-<up>") 'tabbar-backward) ; switch to previous file tab

(global-set-key (kbd "C-<tab>") 'swbuff-switch-to-next-buffer) ; switch to next buffer
(global-set-key (kbd "C-S-<tab>") 'swbuff-switch-to-previous-buffer) ; switch to previous buffer


;; -----------------------------------------------------------------------------
;; windows ---------------------------------------------------------------------

(global-set-key (kbd "M-\\") 'delete-window) ; close current window
(global-set-key (kbd "M-1") 'delete-other-windows) ; close all other windows
(global-set-key (kbd "M-2") 'split-window-vertically) ; split window vertically
(global-set-key (kbd "M-3") 'split-window-horizontally) ; split window horizontally

(global-set-key (kbd "M-S-<right>") (fnie 'windmove-right)) ; move → window
(global-set-key (kbd "M-S-<left>") (fnie 'windmove-left)) ; move ← window
(global-set-key (kbd "M-S-<down>") (fnie 'windmove-down)) ; move ↓ window
(global-set-key (kbd "M-S-<up>") (fnie 'windmove-up)) ; move ↑ window

(global-set-key (kbd "C-M-S-<right>") (fnie 'buf-move-right)) ; swap → buffers
(global-set-key (kbd "C-M-S-<left>") (fnie 'buf-move-left)) ; swap ← buffers
(global-set-key (kbd "C-M-S-<down>") (fnie 'buf-move-down)) ; swap ↓ buffers
(global-set-key (kbd "C-M-S-<up>") (fnie 'buf-move-up)) ; swap ↑ buffers


;; -----------------------------------------------------------------------------
;; search and replace ----------------------------------------------------------

(global-set-key (kbd "C-s") 'isearch-forward) ; forward search string
(global-set-key (kbd "C-r") 'isearch-backward) ; backward search string

(global-set-key (kbd "C-M-s") 'isearch-forward-regexp) ; forward search regexp
(global-set-key (kbd "C-M-r") 'isearch-backward-regexp) ; backward search regexp


;; -----------------------------------------------------------------------------
;; navigation ------------------------------------------------------------------

(global-set-key (kbd "C-<down>") 'scroll-up-line) ; scroll 1 line down
(global-set-key (kbd "C-<up>") 'scroll-down-line) ; scroll 1 line up

(global-set-key (kbd "M-g c") 'goto-char) ; go to char
(global-set-key (kbd "M-g l") 'goto-line) ; go to line
(global-set-key (kbd "M-g g") 'goto-line) ; go to line

(define-prefix-command 'm-j-map)
(global-set-key (kbd "M-j") 'm-j-map)
(define-key m-j-map (kbd "c") 'ace-jump-char-mode) ; jump to char
(define-key m-j-map (kbd "w") 'ace-jump-word-mode) ; jump to word
(define-key m-j-map (kbd "l") 'ace-jump-line-mode) ; jump to line
(define-key m-j-map (kbd "j") 'ace-jump-word-mode) ; jump to word

(global-set-key (kbd "<right>") 'forward-char) ; move → char
(global-set-key (kbd "<left>") 'backward-char) ; move ← char
(global-set-key (kbd "<down>") 'next-line) ; move ↓ line
(global-set-key (kbd "<up>") 'previous-line) ; move ↑ line

(global-set-key (kbd "C-<right>") 'forward-word) ; move → word
(global-set-key (kbd "C-<left>") 'backward-word) ; move ← word

(define-key sp-keymap (kbd "M-d") 'sp-forward-sexp) ; move → sexp
(define-key sp-keymap (kbd "M-a") 'sp-backward-sexp) ; move ← sexp

(define-key sp-keymap (kbd "M-s") 'sp-down-sexp) ; move ↓ → sexp
(define-key sp-keymap (kbd "M-w") 'sp-backward-up-sexp) ; move ↑ ← sexp
(define-key sp-keymap (kbd "M-S") 'sp-backward-down-sexp) ; move ↓ ← sexp
(define-key sp-keymap (kbd "M-W") 'sp-up-sexp) ; move ↑ → sexp

(define-key sp-keymap (kbd "M-q") 'sp-beginning-of-sexp) ; move to start of sexp
(define-key sp-keymap (kbd "M-e") 'sp-end-of-sexp) ; move to end of sexp
(global-set-key (kbd "M-Q") 'beginning-of-defun) ; move to start of function
(global-set-key (kbd "M-E") 'end-of-defun) ; move to end of function


;; -----------------------------------------------------------------------------
;; selecting -------------------------------------------------------------------

(global-set-key (kbd "M-c") 'mc/mark-all-dwim) ; multiple cursors

(global-set-key (kbd "C-e") 'er/expand-region) ; expand region
(global-set-key (kbd "C-S-e") 'er/contract-region) ; contract region

(global-set-key (kbd "C-a") 'mark-whole-buffer) ; select all

(global-set-key (kbd "S-<SPC>") 'set-mark-command) ; set mark


;; -----------------------------------------------------------------------------
;; editing ---------------------------------------------------------------------

;;(global-set-key (kbd "C-x") 'kill-region) ; cut -> cua
;;(global-set-key (kbd "C-c") 'copy-region-as-kill) ; copy -> cua
;;(global-set-key (kbd "C-v") 'yank) ; paste -> cua

(global-set-key (kbd "C-z") 'undo-tree-undo) ; undo
(global-set-key (kbd "C-y") 'undo-tree-redo) ; redo
(global-set-key (kbd "C-x u") 'undo-tree-visualize) ; view undo/redo history

(global-set-key (kbd "C-k") 'kill-line) ; forward kill line

(global-set-key (kbd "M-l") 'downcase-word) ; lower-case word
(global-set-key (kbd "M-u") 'upcase-word) ; upper-case word

(define-key sp-keymap (kbd "M-(") (fnify (sp-wrap-with-pair "("))) ; wrap sexp with ()
(define-key sp-keymap (kbd "M-[") (fnify (sp-wrap-with-pair "["))) ; wrap sexp with []
(define-key sp-keymap (kbd "M-{") (fnify (sp-wrap-with-pair "{"))) ; wrap sexp with {}
(define-key sp-keymap (kbd "M-\"") (fnify (sp-wrap-with-pair "\""))) ; wrap sexp with ""
(define-key sp-keymap (kbd "M-'") (fnify (sp-wrap-with-pair "'"))) ; wrap sexp with ''
(define-key sp-keymap (kbd "H-u") 'sp-unwrap-sexp) ; unwrap sexp

(define-key sp-keymap (kbd "H-k") 'sp-kill-sexp) ; forward kill sexp
(define-key sp-keymap (kbd "H-K") 'sp-backward-kill-sexp) ; backward kill sexp

(define-key sp-keymap (kbd "H-s") 'sp-split-sexp) ; split sexp
(define-key sp-keymap (kbd "H-j") 'sp-join-sexp) ; join sexp

(define-key sp-keymap (kbd "H-w") 'sp-raise-sexp) ; raise sexp
(define-key sp-keymap (kbd "H-W") 'sp-splice-sexp-killing-backward) ; backward splice sexp

(define-key sp-keymap (kbd "H-d") 'sp-forward-slurp-sexp) ; forward slurp sexp
(define-key sp-keymap (kbd "H-a") 'sp-forward-barf-sexp) ; forward barf sexp


;; -----------------------------------------------------------------------------
;; programming -----------------------------------------------------------------

(global-set-key (kbd "C-<SPC>") 'company-complete) ; show completion menu

(define-key lisp-mode-map (kbd "M-.") 'slime-edit-defition) ; go to definition
(define-key lisp-mode-map (kbd "M-,") 'slime-pop-find-definition-stack) ; go back
(define-key lisp-mode-map (kbd "C-x C-e") 'slime-eval-last-expression) ; evaluate last expression

(define-key emacs-lisp-mode-map (kbd "M-.") 'elisp-slime-nav-find-elisp-thing-at-point) ; go to definition
(define-key emacs-lisp-mode-map (kbd "M-,") 'pop-tag-mark) ; go back
(define-key emacs-lisp-mode-map (kbd "C-x C-e") 'eval-last-sexp) ; evaluate last expression


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-key-bindings)
