(in-package :cl-wt)

(defclass WCONTAINERWIDGET (WWIDGET)
  ((layout :accessor layout
	   :initarg :layout
	   :documentation "Layout manager")
   (padding :accessor padding
	    :initarg :padding
	    :initform 0
	    :documentation "padding has the effect of adding
distance between the widget children and the border")))

(defmethod add-widget ((cont WCONTAINERWIDGET) (w WWIDGET))
  nil)

(defmethod remove-widget ((cont WCONTAINERWIDGET) (w WWIDGET))
  nil)

(defmethod clear ((cont WCONTAINERWIDGET))
  nil)

