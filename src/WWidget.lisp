(in-package :cl-wt)

(defclass WLENGTH ()
  ((value :accessor value
	  :initform 0
	  :initarg :value)
   (unit :accessor unit
	 :initform "px"
	 :initarg :unit)))

(defclass WCOLOR ()
  ((name :accessor name
	 :initarg :name
	 :documentation "the CSS name")
   (red  :accessor red
	 :initarg :red
	 :documentation "red component")
   (green  :accessor green
	   :initarg :green
	   :documentation "green component")
   (blue  :accessor blue
	  :initarg :blue
	  :documentation "blue component")
   (alpha  :accessor alpha
	 :initarg :alpha
	 :documentation "alpha component")
   (color-default :accessor default
		  :initarg :default
		  :initform nil
		  :documentation "Color is the default color")))
   
(defmethod css-text((color WCOLOR) &key (with-alpha nil))
  "not implemented")
     
(defclass WCSSDECORATIONSTYLE ()
  ((cursor :accessor cursor
	   :initform ""
	   :initarg :cursor
	   :documentation "Cursor style")
   (background-color :accessor background-color
		     :initform (make-instance 'WCOLOR :default T)
		     :initarg :background-color
		     :documentation "Background color")
   (foreground-color :accessor foreground-color
		     :initform (make-instance 'WCOLOR :default T)
		     :initarg :foreground-color
		     :documentation "Foreground color")
   (border-top :accessor border-top
		   :initarg :border-top
		   :documentation "CSS border top")
   (border-bottom :accessor border-bottom
		      :initarg :border-bottom
		      :documentation  "CSS border bottom")
   (border-left :accessor border-left
		    :initarg :border-left
		    :documentation "border left")
   (border-right :accessor border-right
		     :initarg :border-right
		     :documentation "border right")
   (border-centerx :accessor border-centerx
		       :initarg :border-centerx
		       :documentation "border centerx")
   (border-centery :accessor border-centery
		       :initarg :border-centery
		       :documentation "CSS border centery")
   font
   text-decoration))

(defmethod set-all-borders ((decoration WCSSDECORATIONSTYLE) border)
  (setf (border-top decoration) border)
  (setf (border-bottom decoration) border)
  (setf (border-left decoration) border)
  (setf (border-right decoration) border)
  (setf (border-centerx decoration) border)
  (setf (border-centery decoration) border))

(defclass WWIDGET ()
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
	     :documentation "children of this object")
   (position-scheme :accessor position-scheme
		    :initarg :position-scheme
		    :documentation "specify a layout mechanism for this widget")
   (offset :accessor offset
	   :initarg :offset
	   :initform (make-instance 'WLENGTH)
	   :documentation "CSS offset for widget - setting with WLENGHT")
   (width :accessor width
	  :initarg :width
	  :initform (make-instance 'WLENGTH)
	  :documentation "Width of widget")
   (heigth :accessor heigth
	   :initarg :heigth
	   :initform (make-instance 'WLENGTH)
	   :documentation "Heigth of widget")
   (minimum-width :accessor minimum-width
		  :initarg :minimum-width
		  :initform (make-instance 'WLENGTH)
		  :documentation "Minimum width of widget")
   (minimum-heigth :accessor minimum-heigth
		   :initarg :minimum-heigth
		   :initform (make-instance 'WLENGTH)
		   :documentation "Minimum heigth of widget")
   (maximum-width :accessor maximum-width
		  :initarg :maximum-width
		  :initform (make-instance 'WLENGTH)
		  :documentation "Maximum width of widget")
   (maximum-heigth :accessor maximum-heigth
		   :initarg :maximum-heigth
		   :initform (make-instance 'WLENGTH)
		   :documentation "Maximum heigth of widget")
   (line-heigth :accessor line-heigth
		:initarg :line-heigth
		:initform (make-instance 'WLENGTH)
		:documentation "CSS line heigth for contained text")
   (float-size :accessor float-size
	       :initarg :float-size
	       :documentation "CSS float side")
   (clear-side-top :accessor clear-side-top
		   :initarg :clear-side-top
		   :documentation "Sides that should be cleared of float top")
   (clear-side-bottom :accessor clear-side-bottom
		      :initarg :clear-side-bottom
		      :documentation
		      "Sides that should be cleared of float bottom")
   (clear-side-left :accessor clear-side-left
		    :initarg :clear-side-left
		    :documentation "Sides that should be cleared of float left")
   (clear-side-right :accessor clear-side-right
		     :initarg :clear-side-right
		     :documentation "Sides that should be cleared of float right")
   (clear-side-centerx :accessor clear-side-centerx
		       :initarg :clear-side-centerx
		       :documentation
		       "Sides that should be cleared of float centerx")
   (clear-side-centery :accessor clear-side-centery
		       :initarg :clear-side-centery
		       :documentation
		       "Sides that should be cleared of float centery")
   (margin-side-top :accessor margin-side-top
		    :initarg :margin-side-top
		    :documentation "CSS margin top")
   (margin-side-bottom :accessor margin-side-bottom
		       :initarg :margin-side-bottom
		       :documentation  "CSS margin  bottom")
   (margin-side-left :accessor margin-side-left
		     :initarg :margin-side-left
		     :documentation "CSS margin left")
   (margin-side-right :accessor margin-side-right
		      :initarg :margin-side-right
		      :documentation "CSS margin right")
   (margin-side-centerx :accessor margin-side-centerx
			:initarg :margin-side-centerx
			:documentation "CSS margin centerx")
   (margin-side-centery :accessor margin-side-centery
			:initarg :margin-side-centery
			:documentation "CSS margin centery")
   (hidden :accessor hidden
	   :initarg :hidden
	   :initform nil
	   :documentation "Hidden or show this widget")
   (enable :accessor enable
	   :initarg :enable
	   :initform T
	   :documentation "Enable or disable this widget")
   (popup :accessor popup
	  :initarg :popup
	  :initform nil
	  :documentation "lets widget overlay over ober sibling widgets")
   (inline-render :accessor inline-render
		  :initarg :inline-render
		  :initform nil
		  :documentation "Widget is displayed inline or as block")
   (decoration-style :accessor decoration-style
		     :initarg :decoration-style
		     :initform (make-instance 'WCSSDECORATIONSTYLE)
		     :documentation "CSS decoration style")
   (style-class :accessor style-class
		:initarg :style-class
		:initform '()
		:documentation "CSS Style class")
   vertical-aligment
   (tootip :accessor tooltip
	   :initarg :tooltip
	   :documentation "Tootip")
   (attribute-value :accessor attribute-value
		    :initarg :attribute-value
		    :initform (make-hash-table :test 'equal)
		    :documentation "Attribute value of this widget")
   (tab-index :accessor tab-index
	      :initarg :tab-index
	      :documentation "Tab index of this widget")
   (clicked :accessor clicked
	    :initarg :clicked
	    :initform nil
	    :documentation "Handle event of widget clicked")))   

(defmethod add-child ((obj WWIDGET) (child WWIDGET))
  (setf (parent child) obj)
  (setf (children obj) (reverse (cons child (reverse (children obj))))))

(defmethod remove-child ((obj WWIDGET) (child WWIDGET))
  (setf (parent child) nil)
  (setf (children obj) (remove child (children obj))))

;;(defmethod resize
;;(defmethod position-at
;;(defmethod set-all-margins
;;(defmethod is-visible
;;(defmethod add-style-class
;;(defmethod remove-style-class

(defmethod refresh ((widget WWIDGET))
  "")

;;(defmethod jsref
;;(defmethod load
;;(defmethod is-load
;;(defmethod do-javascript
;;(defmethod hide
;;(defmethod show
;;(defmethod enable
;;(defmethod disable
;;(defmethod enableAjax
;;(defmethod propagate-set-enable

(defmethod process-data ((widget WWIDGET))
  nil)

(defmethod process-event ((widget WWIDGET) origin event)
  (if (equal origin (write-to-string (id widget)))
      (progn
	(if (string-equal event "clicked")
	    (if (clicked widget)
		(apply (clicked widget) '()))))))

  
(defmethod script ((widget WWIDGET))
  (concatenate 'string
	       (if (clicked widget)
		   (concatenate 'string
				"document.getElementById('"
				(write-to-string (id widget))
				"').onclick = function(evt) { stopPropagation(evt); send('"
				(write-to-string (id widget))
				"', 'clicked'); };"))))

(defmethod render-begin ((widget WWIDGET))
  (concatenate 'string
  	       "<div id='"
	       (write-to-string (id widget))
	       "'>"))

(defmethod render-end ((widget WWIDGET))
  "</div>")

(defmethod render-body ((widget WWIDGET))
  "")

(defmethod render ((widget WWIDGET))
  (concatenate 'string
	       (render-begin widget)
	       (render-body widget)
	       (render-end widget)))
	       
