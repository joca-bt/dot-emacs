;; -----------------------------------------------------------------------------
;; meta and utils --------------------------------------------------------------

;; mode-local variables
(require 'mode-local)


;; -----------------------------------------------------------------------------
;; helper macros and functions -------------------------------------------------

(defmacro fnify (&rest body)
  "Wraps a set of Lisp forms under an interactive function."
  `(lambda ()
     (interactive)
     ,@body))

(defmacro fnie (fn)
  "Wraps an interactive function call under the `ignore-errors' macro."
  `(fnify
    (ignore-errors
      (funcall ,fn))))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-utils)
