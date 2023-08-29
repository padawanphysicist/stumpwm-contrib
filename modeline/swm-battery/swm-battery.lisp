;;;; swm-battery.lisp

(defpackage #:swm-battery
  (:use #:cl :stumpwm))

(in-package #:swm-battery)

(load-module "swm-bs-colors")

(defun fmt--color (str &key (bg :dark) (fg :light))
  (format nil
          "^[^(:fg \"~a\")^(:bg \"~a\") ~a ^]"
          (swm-bs-colors::get-bs-color fg)
          (swm-bs-colors::get-bs-color bg)
          str))

(defun btt--battery-percentage ()
  (with-input-from-string
      (in (run-shell-command "acpitool -b | cut -d: -f2 | cut -d, -f2 | cut -d'%' -f1" t))
    (read in)))
(defun btt--ac-power-status-p ()
  (let ((ac-status (string-trim " " (substitute #\Space #\Newline (run-shell-command "acpitool -a | cut -d: -f2 | sed 's/^ *//g'" t)))))
    (if (string= "online" ac-status) t nil)))

(defun swm-battery-state (ml)
  (declare (ignore ml))
  (let ((battery-percentage (btt--battery-percentage))
        (on-ac (btt--ac-power-status-p))
        (fmt "~a~,1f%"))
    (let ((fmt-string (cond ((> battery-percentage 65) (fmt--color fmt :bg :success :fg :dark))
                            ((and (> battery-percentage 20) (< 65)) (fmt--color fmt :bg :warning :fg :dark))
                            ((< battery-percentage 20) (fmt--color fmt :bg :danger :fg :dark))
                            (t (fmt--color fmt :bg 'dark :fg 'light)))))
      (format nil fmt-string (if on-ac "(AC) " "") battery-percentage))))


;; (defun fmt-hostname (ml)
;;   "Return hostname"
;;   (declare (ignore ml))
;;   (format nil "~a" (car (split-string (machine-instance) ". "))))


(add-screen-mode-line-formatter #\B #'swm-battery-state)
