;; -----------------------------------------------------------------------------
;; navigation ------------------------------------------------------------------

;; jump to text
(setq ace-jump-mode-scope 'frame
      ace-jump-word-mode-use-query-char t
      ace-jump-mode-case-fold t
      ace-jump-mode-detect-punc t
      ace-jump-mode-mark-ring-max +history-size+
      ace-jump-mode-move-keys (append (number-sequence ?a ?z) (number-sequence ?A ?Z)))

;; buffer switching
(setq swbuff-display-intermediate-buffers t
      swbuff-clear-delay 0.75
      swbuff-clear-delay-ends-switching t
      swbuff-status-window-layout 'scroll
      swbuff-special-buffers-re "^[ *]"
      swbuff-include-buffer-regexps '("^*Customize" "^*Help" "^*Package" "^*scratch" "^*slime")
      swbuff-exclude-buffer-regexps '("^[ *]"))

;; window navigation
(setq windmove-wrap-around nil)

;; file browser
(setq neo-theme 'nerd
      neo-smart-open t
      neo-dont-be-alone t
      neo-persist-show t
      neo-cwd-line-style 'button
      neo-show-updir-line nil
      neo-show-hidden-files t
      neo-window-width 30)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-navigation)
