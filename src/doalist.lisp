(in-package #:trivial-do)


(defmacro doalist ((key-var value-var alist-form &optional result-form) &body body)
  "doalist iterates over the elements of an alist and binds key-var to the car of each element,
value-var to the cdr of each element and then evaluates body as a tagbody that can include
declarations. Finally the result-form is returned after the iteration completes."
  (let ((tail (gensym))
        (repeat (gensym)))
    `(prog (,key-var
            ,value-var
            (,tail ,alist-form))
      ,repeat
       (unless ,tail
         (setq ,key-var nil
               ,value-var nil)
         (return ,result-form))
       (setq ,key-var (caar ,tail))
       (setq ,value-var (cdr (pop ,tail)))
       (locally ,@body)
       (go ,repeat))))

       
