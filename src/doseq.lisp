(in-package :trivial-do)


(defmacro doseq* ((position-var value-var seq-form &optional result-form) &rest body)
  (let ((ev-seq-form (gensym))
        (repeat (gensym))
        (accessor (gensym)))
    `(let ((,ev-seq-form ,seq-form))
       (if (listp ,ev-seq-form)
         (dolist* (,position-var ,value-var ,ev-seq-form ,result-form)
           ,@body)
         (prog ((,accessor (typecase ,ev-seq-form
                              (simple-vector #'svref)
                              (string #'char)
                              (otherwise #'elt)))
                ,value-var
                (,position-var 0)
                (,ev-seq-form ,seq-form))
          ,repeat
           (unless (< ,position-var (length ,ev-seq-form))
             (setq ,value-var nil
                   ,position-var nil)
             (return ,result-form))
           (setq ,value-var (funcall ,accessor ,ev-seq-form ,position-var))
           (locally ,@body)
           (incf ,position-var)
           (go ,repeat))))))


(defmacro doseq ((var seq-form &optional result-form) &rest body)
  #+clisp
    `(ext:doseq (,var ,seq-form ,result-form)
       ,@body)
  #+sbcl
    `(sb-sequence:dosequence (,var ,seq-form ,result-form)
       ,@body)
  #-(or clisp sbcl)
    `(doseq* (,(gensym) ,var ,seq-form ,result-form)
       ,@body))

