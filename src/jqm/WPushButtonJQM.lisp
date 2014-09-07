(in-package :cl-wt)

(defclass WPUSHBUTTONJQM (WPUSHBUTTON)
  ((data-icon :accessor data-icon
	      :initarg :data-icon
	      :initform ""
	      :documentation "Icon for display in button")
   (data-iconpos :accessor data-iconpos
		 :initarg :data-iconpos
		 :initform ""
		 :documentation "Position of icon in button")))


(defmethod render-body ((widget WPUSHBUTTONJQM))
  (concatenate 'string
  	       "<button id='"
	       (write-to-string (id widget))
	       "-btn' class='ui-btn "
	       (data-icon widget) " "
	       (data-iconpos widget)
	       "'>"
	       (text widget)
	       "</button>"))


