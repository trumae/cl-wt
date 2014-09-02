(in-package :cl-wt)

(defclass WPUSHBUTTON (WWIDGET)
  ((text :accessor text
	 :initarg :text
	 :initform ""
	 :documentation "Text displayed")))

(defmethod render-body ((button WPUSHBUTTON))
  (concatenate 'string
	       "<button id='"
	       (write-to-string (id button))
	       "-btn'>"
	       (sanitize:clean (text button) sanitize:+DEFAULT+)
	       "</button>"))


