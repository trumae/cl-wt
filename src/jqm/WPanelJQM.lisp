(in-package :cl-wt)

(defclass WPANELJQM (WWIDGET)
  ((data-position :accessor data-position
		  :initarg :data-position
		  :initform "left"
		  :documentation "Position of panel in page - possible values ('right','left')")
   (data-display :accessor data-display
		 :initarg :data-display
		 :initform "overlay"
		 :documentation "Way for display the panel in the page - p.v. ('overlay','reveal','push')")))

(defmethod render-begin ((widget WPANELJQM))
  (concatenate 'string
  	       "<div data-role='panel' id='"
	       (write-to-string (id widget))
	       "' data-position='"
	       (data-position widget)
	       "' data-display='"
	       (data-position widget)
	       "'>"))

   
