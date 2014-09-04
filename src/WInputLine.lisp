(in-package :cl-wt)

(defclass WINPUTLINE (WWIDGET)
  ((echo-mode :accessor echo-mode
	      :initform 'normal
	      :initarg :echo-mode
	      :documentation "Describe how the contents is displayed")
   (text :accessor text
	 :initform ""
	 :initarg :text
	 :documentation "current content")
   (max-length :accessor max-length
	       :initform 30
	       :initarg :max-length
	       :documentation "Specifies the maximum length of text that can be entered")))

(defmethod process-data ((input WINPUTLINE))
  (if (hunchentoot:parameter (write-to-string (id input)))
      (setf (text input) (hunchentoot:parameter (write-to-string (id input))))))

(defmethod render-body ((input WINPUTLINE))
  (concatenate 'string
	       "<input name='" (write-to-string (id input)) 
	       "' value='"(text input) "' />"))

