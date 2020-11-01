(asdf:defsystem #:trivial-do
  :description "Looping extensions that follow the style of the core DO functions."
  :version "0.1"
  :author "Tarn W. Burton"
  :license "MIT"
  :components ((:module src
                        :serial t
                        :components
                        ((:file "packages")
                         (:file "doalist")
                         (:file "dohash")
                         (:file "dolist")
                         (:file "doplist")
                         (:file "doseq"))))
  .
  #+asd3 (:version "0.1"
           :homepage "https://github.com/yitzchak/trivial-do"
           :bug-tracker "https://github.com/yitzchak/trivial-do/issues")
  #-asd3 ())
