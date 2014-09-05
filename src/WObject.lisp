(in-package :cl-wt)

(defclass WOBJECT ()
  ((id :accessor id
       :initform (uuid:make-v4-uuid)
       :documentation "unique identifier for this object")
   (name :accessor name
	 :initarg :name
	 :documentation "object name")
   (parent :accessor parent
	   :initform nil
	   :initarg :parent
	   :documentation "parent of object")
   (children :accessor children
	      :initform '()
	      :documentation "children of this object")))

(defmethod add-child ((obj WOBJECT) (child WOBJECT))
  (setf (parent child) obj)
  (setf (children obj) (reverse (cons child (reverse (children obj))))))

(defmethod remove-child ((obj WOBJECT) (child WOBJECT))
  (setf (parent child) nil)
  (setf (children obj) (remove child (children obj))))

