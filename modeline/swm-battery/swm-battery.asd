;;;; swm-battery.asd

(asdf:defsystem #:swm-battery
  :description "Describe swm-battery here"
  :author "Your Name <your.name@example.com>"
  :license  "Specify license here"
  :version "0.0.1"
  :serial t
  :depends-on (#:stumpwm)
  :components ((:file "package")
               (:file "swm-battery")))
