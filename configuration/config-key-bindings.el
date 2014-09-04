;; -----------------------------------------------------------------------------
;; key bindings ----------------------------------------------------------------
;;
;; useful key bindings:
;;   C-x C-s - save buffer
;;   C-x C-c - quit Emacs
;;   C-h b - show all key bindings
;;   C-h k - describe key binding
;;
;; organization:
;;   help, commands
;;   files and buffers
;;   windows
;;   search and replace
;;   navigation
;;   selecting
;;   editing
;;   programming
;;   lisp

;; region-local key bindings
(require 'region-bindings-mode)
(region-bindings-mode-enable)

;; key chords
(require 'key-chord)
(key-chord-mode t)

(global-unset-key [mouse-2])
(global-unset-key [mouse-3])


;; -----------------------------------------------------------------------------
;; help

(global-set-key (kbd "C-h b") 'describe-bindings) ; show all key bindings
(global-set-key (kbd "C-h k") 'describe-key) ; key binding -> command
(global-set-key (kbd "C-h w") 'where-is) ; command -> key bindings

(global-set-key (kbd "C-h m") 'describe-mode) ; show all active modes


;; -----------------------------------------------------------------------------
;; commands

(global-set-key (kbd "C-x C-c") 'save-buffers-kill-terminal) ; quit Emacs

(global-set-key (kbd "M-x") 'smex) ; execute command
(global-set-key (kbd "M-X") 'smex-major-mode-commands) ; execute major-mode relevant command


;; -----------------------------------------------------------------------------
;; files and buffers

(global-set-key (kbd "C-x C-r") 'recentf-open-files) ; recent files list
(global-set-key (kbd "<f8>") 'neotree-toggle) ; file browser

(global-set-key (kbd "C-x C-s") 'save-buffer) ; save buffer
(global-set-key (kbd "C-w") 'kill-this-buffer) ; close buffer

(global-set-key (kbd "C-<tab>") 'swbuff-switch-to-next-buffer) ; next buffer
(global-set-key (kbd "C-S-<tab>") 'swbuff-switch-to-previous-buffer) ; previous buffer

(global-set-key (kbd "M-<down>") 'tabbar-forward) ; next file tab
(global-set-key (kbd "M-<up>") 'tabbar-backward) ; previous file tab


;; -----------------------------------------------------------------------------
;; windows

(global-set-key (kbd "C-x \\") 'delete-window) ; close current window
(global-set-key (kbd "C-x 1") 'delete-other-windows) ; close other windows
(global-set-key (kbd "C-x 2") 'split-window-vertically) ; split window vertically
(global-set-key (kbd "C-x 3") 'split-window-horizontally) ; split window horizontally

(global-set-key (kbd "C-x <right>") (fnie 'windmove-right)) ; move to window on the right
(global-set-key (kbd "C-x <left>") (fnie 'windmove-left)) ; move to window on the left
(global-set-key (kbd "C-x <down>") (fnie 'windmove-down)) ; move to window below
(global-set-key (kbd "C-x <up>") (fnie 'windmove-up)) ; move to window above

(global-set-key (kbd "C-x C-<right>") (fnie 'buf-move-right)) ; swap with window on the right
(global-set-key (kbd "C-x C-<left>") (fnie 'buf-move-left)) ; swap with window on the left
(global-set-key (kbd "C-x C-<down>") (fnie 'buf-move-down)) ; swap with window below
(global-set-key (kbd "C-x C-<up>") (fnie 'buf-move-up)) ; swap with window above


;; -----------------------------------------------------------------------------
;; search and replace

(global-set-key (kbd "C-s") 'isearch-forward) ; search string forward
(global-set-key (kbd "C-r") 'isearch-backward) ; search string backward

(global-set-key (kbd "C-M-s") 'isearch-forward-regexp) ; search regexp forward
(global-set-key (kbd "C-M-r") 'isearch-backward-regexp) ; search regexp backward

(global-set-key (kbd "C-S-s") 'query-replace) ; replace string
(global-set-key (kbd "C-M-S-s") 'query-replace-regexp) ; replace regexp


;; -----------------------------------------------------------------------------
;; navigation

(global-set-key (kbd "C-<down>") (fnify (scroll-up 1))) ; scroll line down
(global-set-key (kbd "C-<up>") (fnify (scroll-down 1))) ; scroll line up

(global-set-key (kbd "M-j") 'ace-jump-mode) ; jump to text


;; -----------------------------------------------------------------------------
;; selecting

(global-set-key (kbd "C-e") 'er/expand-region) ; expand region
(global-set-key (kbd "C-S-e") 'er/contract-region) ; contract region

(global-set-key (kbd "C-a") 'mark-whole-buffer) ; select all

(global-set-key (kbd "M-<SPC>") 'set-mark-command) ; set mark


;; -----------------------------------------------------------------------------
;; editing

;;(global-set-key (kbd "C-x") 'kill-region) ; cut -> cua
;;(global-set-key (kbd "C-c") 'copy-region-as-kill) ; copy -> cua
;;(global-set-key (kbd "C-v") 'yank) ; paste -> cua

(global-set-key (kbd "C-z") 'undo-tree-undo) ; undo
(global-set-key (kbd "C-y") 'undo-tree-redo) ; redo
(global-set-key (kbd "C-x u") 'undo-tree-visualize) ; view undo/redo history


;; -----------------------------------------------------------------------------
;; programming

(global-set-key (kbd "C-h c") 'describe-class) ; describe class
(global-set-key (kbd "C-h f") 'describe-function) ; describe function
(global-set-key (kbd "C-h g") 'describe-generic) ; describe generic function
(global-set-key (kbd "C-h p") 'describe-package) ; describe package
(global-set-key (kbd "C-h v") 'describe-variable) ; describe variable

(global-set-key (kbd "C-h C-f") 'find-function) ; find function definition
(global-set-key (kbd "C-h C-v") 'find-variable) ; find variable definition

(global-set-key (kbd "C-<SPC>") 'auto-complete) ; auto-completion


;; -----------------------------------------------------------------------------
;; lisp

(define-key lisp-mode-map (kbd "M-.") 'slime-edit-defition) ; go to definition
(define-key lisp-mode-map (kbd "M-,") 'slime-pop-find-definition-stack) ; go back
(define-key lisp-mode-map (kbd "C-x C-e") 'slime-eval-last-expression) ; evaluate expression

(define-key emacs-lisp-mode-map (kbd "M-.") 'elisp-slime-nav-find-elisp-thing-at-point) ; go to definition
(define-key emacs-lisp-mode-map (kbd "M-,") 'pop-tag-mark) ; go back
(define-key emacs-lisp-mode-map (kbd "C-x C-e") 'eval-last-sexp) ; evaluate expression


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-key-bindings)
