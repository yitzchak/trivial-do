(in-package :trivial-do)


(defmacro dohash ((key-var value-var hash-table-form &optional result-form) &body body)
  "dohash iterates over the elements of an hash table and binds key-var to the key,
value-var to the associated value and then evaluates body as a tagbody that can include
declarations. Finally the result-form is returned after the iteration completes."
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
