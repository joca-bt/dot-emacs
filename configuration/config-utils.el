;; -----------------------------------------------------------------------------
;; meta and utils --------------------------------------------------------------

(require 'dash)
(require 's)
(require 'mode-local)

(setq debug-on-error t)


;; -----------------------------------------------------------------------------
;; helper macros and functions -------------------------------------------------

(defmacro fnify (&rest body)
  "Wraps a set of Lisp forms under an interactive function."
  `(lambda ()
     (interactive)
     ,@body))

(defmacro fnie (fn)
  "Wraps an interactive function call with the `ignore-errors' macro."
  `(fnify
    (ignore-errors
      (funcall ,fn))))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-utils)
