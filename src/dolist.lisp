(in-package :trivial-do)


(defmacro dolist* ((position-var value-var list-form &optional result-form) &body body)
  "dolist* iterates over the elements of an list and binds position-var to the index of each
element, value-var to each element and then evaluates body as a tagbody that can include
declarations. Finally the result-form is returned after the iteration completes."
  (let ((head (gensym))
        (repeat (gensym)))
    `(prog (,value-var
            (,position-var 0)
            (,head ,list-form))
      ,repeat
       (unless ,head
         (setq ,value-var nil
               ,position-var nil)
         (return ,result-form))
       (setq ,value-var (pop ,head))
       (locally ,@body)
       (incf ,position-var)
       (go ,repeat))))

