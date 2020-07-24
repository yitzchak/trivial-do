(in-package #:trivial-do)


(defmacro doplist ((key-var value-var alist-form &optional result-form) &body body)
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

       
