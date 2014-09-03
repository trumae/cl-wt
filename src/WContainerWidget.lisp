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

(defun script-list (l)
  (if (null l)
      ""
      (concatenate 'string
		   (script (car l))
		   (script-list (cdr l)))))

(defmethod script ((cont WCONTAINERWIDGET))
  (script-list (children cont)))

(defun process-event-list(l origin event)
  (if (null l)
      nil
      (progn
	(process-event (car l) origin event)
	(process-event-list (cdr l) origin event))))

(defmethod process-event ((cont WCONTAINERWIDGET) origin event)
  (process-event-list (children cont) origin event))
