(in-package :cl-wt)

(defclass WAPPLICATION (WOBJECT)
  ((app-root :accessor app-root
	:initarg :root
	:initform nil
	:documentation "Top level widget container for this application")
   (style-sheets :accessor style-sheets
		 :initform '()
		 :documentation "List of style sheet for this appliction")
   (body-class :accessor body-class
	       :initform ""
	       :initarg :body-class
	       :documentation "Style sheet for entire page")
   (title :accessor title 
	  :initarg :title
	  :documentation "Title of application")))

(defmethod refresh ((app WAPPLICATION))
  "")
