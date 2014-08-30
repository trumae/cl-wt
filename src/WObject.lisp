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
   (childrens :accessor childrens
	      :initform '()
	      :documentation "childrens of this object")))

(defmethod add-child ((obj WOBJECT) (child WOBJECT))
  (setf (childrens obj) (pushnew child (childrens obj))))

(defmethod remove-child ((obj WOBJECT) (child WOBJECT))
  (setf (childrens obj) (remove child (childrens obj))))


