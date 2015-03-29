;; -----------------------------------------------------------------------------
;; spelling --------------------------------------------------------------------

;; spell checking
(setq ispell-program-name "hunspell"
      ispell-extra-args '("-a" "-i" "utf-8")
      rw-hunspell-make-dictionary-menu t
      rw-hunspell-use-rw-ispell t
      rw-ispell-create-pdict-files t
      ispell-silently-savep t
      rw-hunspell-default-dictionary "en_GB-oed"
      rw-hunspell-dicpath-list `(,+dictionaries-dir+)
      rw-ispell-language-pdict-alist `(("^en" . ,(concat +dictionaries-dir+ "pdict-en.dic"))
                                       ("^pt" . ,(concat +dictionaries-dir+ "pdict-pt.dic"))
                                       ("" . ,(concat +dictionaries-dir+ "pdict.dic"))))
;;(rw-hunspell-setup)
;;(rw-ispell-set-up-pdicts)


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-spelling)
