(in-package :cl-wt)

(defclass WANCHOR (WWIDGET)
  ((text :accessor text
	 :initarg :text
	 :initform ""
	 :documentation "Text displayed")
   (rel :accessor rel
	:initform "external"
	:initarg :rel
	:documentation "Type of link")
   (href :accessor href
	 :initarg :href
	 :initform "#"
	 :documentation "Reference")))


(defmethod render-begin ((widget WANCHOR))
  (concatenate 'string
	       "<a href='"
	       (href widget)
	       "' data-ajax='false' rel='"
	       (rel widget)
	       "' >"))

(defmethod render-body ((widget WANCHOR))
  (text widget))

(defmethod render-end ((widget WANCHOR))
  "</a>")
