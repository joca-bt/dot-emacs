;; -----------------------------------------------------------------------------
;; utils -----------------------------------------------------------------------

(defmacro fn (&rest body)
  "Wraps a set of Lisp forms under a function."
  `(lambda ()
     ,@body))

(defmacro ifn (&rest body)
  "Wraps a set of Lisp forms under an interactive function."
  `(fn
    (interactive)
    ,@body))

(defmacro ifncall (fn &rest args)
  "Wraps an interactive function call under the `ignore-errors' macro."
  `(ifn
    (ignore-errors
      (funcall ,fn ,@args))))

(defmacro bind (fn &rest args)
  "Partially apply ARGS to FN."
  (let ((future-args (make-symbol "args")))
    `(lambda (&rest ,future-args)
       (apply ,fn ,@args ,future-args))))


;; -----------------------------------------------------------------------------
;; -----------------------------------------------------------------------------

(provide 'set-utils)
