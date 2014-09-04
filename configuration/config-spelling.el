;; -----------------------------------------------------------------------------
;; spelling --------------------------------------------------------------------

;; hunspell
(require 'ispell)
(require 'rw-hunspell)
(require 'rw-ispell)
(require 'rw-language-and-country-codes)
(setq ispell-program-name "hunspell"
      ispell-extra-args '("-a" "-i" "utf-8")
      ispell-check-comments 'exclusive
      ispell-following-word nil
      rw-hunspell-make-dictionary-menu t
      rw-hunspell-use-rw-ispell t
      rw-ispell-create-pdict-files t
      ispell-silently-savep t
      rw-hunspell-default-dictionary "en_GB-oed"
      rw-hunspell-dicpath-list `(,+dictionaries-dir+)
      rw-ispell-language-pdict-alist `(("^en" . ,(concat +dictionaries-dir+ ".dict-en"))
                                       ("^pt" . ,(concat +dictionaries-dir+ ".dict-pt"))
                                       ("" . ,(concat +dictionaries-dir+ ".dict"))))

;; flyspell
(require 'flyspell)
(setq flyspell-sort-corrections nil
      flyspell-delay 2)

(let ((modes '()))
  (dolist (mode modes)
    (add-hook mode '(lambda ()
                      (flyspell-prog-mode)))))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-spelling)
