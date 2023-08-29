;;;; swm-bs-colors.asd

(asdf:defsystem #:swm-bs-colors
  :description "Define semantic colors like Twitter Bootstrap"
  :author "Victor Santos <vct.santos@protonmail.com>"
  :license  "GPLv3"
  :version "0.0.1"
  :serial t
  :depends-on (#:stumpwm)
  :components ((:file "package")
               (:file "swm-bs-colors")))
