(in-package :cl-wt)


(defclass WSTRING ()
  ((value :accessor value
	 :initform ""
	 :initarg :value)))

(defun WSTRING_tr (key)
  (make-instance 'WSTRING :value ""))
