;; -----------------------------------------------------------------------------
;; meta and utils --------------------------------------------------------------

(require 'mode-local) ; mode-local variables

(setq debug-on-error t) ; debug on error


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
