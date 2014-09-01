(in-package :cl-wt)

(defclass WTEXT (WWIDGET)
  ((text :accessor text
	 :initarg :text
	 :initform ""
	 :documentation "Text displayed")
   (mode :accessor mode
	 :initarg :mode
	 :initform sanitize:+DEFAULT+
	 :documentation "Level of secure")))

(defmethod render-body ((wtext WTEXT))
  (sanitize:clean (text wtext) (mode wtext)))

