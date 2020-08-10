(in-package #:trivial-do)


(defmacro doplist ((key-var value-var alist-form &optional result-form) &body body)
  "doplist iterates over the elements of an plist and binds key-var to the key, value-var to
the associated value and then evaluates body as a tagbody that can include declarations.
Finally the result-form is returned after the iteration completes."
  (let ((tail (gensym))
        (repeat (gensym)))
    `(prog (,key-var
            ,value-var
            (,tail ,alist-form))
      ,repeat
       (unless ,tail
         (return ,result-form))
       (setq ,key-var (pop ,tail))
       (unless ,tail
         (error "Malformed plist"))
       (setq ,value-var (pop ,tail))
       (locally ,@body)
       (go ,repeat))))

       
