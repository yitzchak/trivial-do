(in-package #:trivial-do)


(defmacro doalist ((key-var value-var alist-form &optional result-form) &body body)
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

       
