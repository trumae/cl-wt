(in-package :cl-wt)

(defclass WPANELJQM (WWIDGET)
  ((data-position :accessor data-position
		  :initarg :data-position
		  :initform "left"
		  :documentation "Position of panel in page - possible values ('right','left')")
   (data-display :accessor data-display
		 :initarg :data-display
		 :initform "overlay"
		 :documentation "Way for display the panel in the page - p.v. ('overlay','reveal','push')")
   (data-icon :accessor data-icon
	      :initarg :data-icon
	      :initform "bars"
	      :documentation "icon for button")
   (data-iconpos :accessor data-iconpos
		 :initarg :data-iconpos
		 :initform "notext"
		 :documentation "Position of icon")
   (text-icon :accessor text-icon
	      :initarg :text-icon
	      :initform ""
	      :documentation "Text for icon")))

(defmethod render-begin ((widget WPANELJQM))
  (concatenate 'string
  	       "<div data-role='panel' id='"
	       (write-to-string (id widget))
	       "' data-position='"
	       (data-position widget)
	       "' data-display='"
	       (data-display widget)
	       "'>"))

   
