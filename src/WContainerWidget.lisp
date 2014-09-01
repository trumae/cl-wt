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
  (add-child cont w))

(defmethod remove-widget ((cont WCONTAINERWIDGET) (w WWIDGET))
  (remove-child cont w))

(defmethod clear ((cont WCONTAINERWIDGET))
  (setf (children cont) '()))

(defun render-list (l)
  (if (null l)
      ""
      (concatenate 'string
		   (render (car l))
		   (render-list (cdr l)))))

(defmethod render-body ((cont WCONTAINERWIDGET))
  (render-list (children cont)))

