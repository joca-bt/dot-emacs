;; -----------------------------------------------------------------------------
;; navigation ------------------------------------------------------------------

;; jump to text
(require 'ace-jump-mode)
(setq ace-jump-mode-scope 'frame
      ace-jump-word-mode-use-query-char t
      ace-jump-mode-case-fold t
      ace-jump-mode-detect-punc t
      ace-jump-mode-gray-background t
      ace-jump-mode-mark-ring-max 20
      ace-jump-mode-move-keys (nconc (number-sequence ?a ?z) (number-sequence ?A ?Z)))

;; buffer switching
(require 'swbuff-y)
(setq swbuff-display-intermediate-buffers t
      swbuff-clear-delay 0.75
      swbuff-clear-delay-ends-switching t
      swbuff-status-window-layout 'scroll
      swbuff-separator ", "
      swbuff-special-buffers-re "^[ *]"
      swbuff-include-buffer-regexps '("^*scratch*")
      swbuff-exclude-buffer-regexps '("^[ *]"))

;; window navigation
(require 'windmove)
(setq windmove-wrap-around nil)

;; window swapping
(require 'buffer-move)

;; file browser
(require 'neotree)
(setq neo-dont-be-alone t
      neo-persist-show t
      neo-show-header t
      neo-window-width 25
      neo-create-file-auto-open t
      neo-hidden-files-regexp "^$")


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-navigation)
