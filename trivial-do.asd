(asdf:defsystem #:trivial-do
  :description "Looping extensions that follow the style of the core DO functions."
  :version "0.1"
  :author "Tarn W. Burton"
  :license "MIT"
  :components
    ((:module src
      :serial t
      :components
        ((:file "packages")
         (:file "dohash")
         (:file "dolist")
         (:file "doseq")))))
