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

(defmacro bind (fn &rest args)
  "Partially apply ARGS to FN."
  (let ((future-args (make-symbol "args")))
    `(lambda (&rest ,future-args)
       (apply ,fn ,@args ,future-args))))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'config-utils)
