(in-package :trivial-do)


(defmacro dohash ((key-var value-var hash-table-form &optional result-form) &body body)
  #+clisp
    `(ext:dohash (,key-var ,value-var ,hash-table-form ,result-form)
       ,@body)
  #-clisp
    (let ((next-entry (gensym))
          (more (gensym))
          (repeat (gensym)))
      `(with-hash-table-iterator (,next-entry ,hash-table-form)
         (prog ()
          ,repeat
           (multiple-value-bind (,more ,key-var ,value-var)
                                (,next-entry)
             (unless ,more
               (return ,result-form))
             (locally ,@body))
          (go ,repeat)))))
