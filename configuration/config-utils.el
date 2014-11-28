;; -----------------------------------------------------------------------------
;; meta and utils --------------------------------------------------------------

;; mode-local variables
(require 'mode-local)


;; -----------------------------------------------------------------------------
;; helper macros and functions -------------------------------------------------

(defmacro fn (&rest body)
  "Wraps a set of Lisp forms under a function."
  `(lambda ()
     ,@body))

(defmacro ifn (&rest body)
  "Wraps a set of Lisp forms under an interactive function."
  `(fn
    (interactive)
    ,@body))

(defmacro ifnie (fn)
  "Wraps an interactive function call under the `ignore-errors' macro."
  `(ifn
    (ignore-errors
      (funcall ,fn))))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-utils)
