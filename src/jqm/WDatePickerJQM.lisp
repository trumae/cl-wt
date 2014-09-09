(in-package :cl-wt)

(defclass WDATEPICKERJQM (WINPUTLINE)
  nil)

(defmethod render-body ((input WDATEPICKERJQM))
  (concatenate 'string
	       "<input data-role='date' type='text' name='" (write-to-string (id input)) 
	       "' value='"(text input) "' />"))
