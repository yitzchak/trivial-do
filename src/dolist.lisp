(in-package :trivial-do)


(defmacro dolist* ((position-var value-var list-form &optional result-form) &rest body)
  (let ((head (gensym))
        (repeat (gensym)))
    `(prog (,value-var
            (,position-var 0)
            (,head ,list-form))
      ,repeat
       (unless ,head
         (return ,result-form))
       (setq ,value-var (pop ,head))
       ,@body
       (incf ,position-var)
       (go ,repeat))))

