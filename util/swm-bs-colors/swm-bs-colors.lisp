;;;; swm-bs-colors.lisp

;; (defpackage #:swm-bs-colors
;;   (:use #:cl :stumpwm))
(defpackage :swm-bs-colors
  (:use :cl)
  (:export #:put-bs-color #:get-bs-color))

(in-package #:swm-bs-colors)

;;(export '(get-bs-color put-bs-color))

(defvar *bs-colors* (make-hash-table)
  "Define semantic colors")

(defun put-bs-color (name obj)
  (setf (gethash name *bs-colors*) obj))

(defun get-bs-color (name &optional default)
  (gethash name *bs-colors* default))

(put-bs-color :primary "#2c4a96")
(put-bs-color :secondary "#7862ce")
(put-bs-color :success "#07b467")
(put-bs-color :info "#f49d14")
(put-bs-color :warning "#e7cf06")
(put-bs-color :danger "#fa1702")
(put-bs-color :light "#ffffff")
(put-bs-color :dark "#1d1f21")
