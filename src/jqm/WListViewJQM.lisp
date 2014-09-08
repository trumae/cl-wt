(in-package :cl-wt)

(defclass WITEMLISTVIEWJQM (WCONTAINERWIDGET)
  ((is-divider :accessor is-divider
	       :initarg :is-divider
	       :initform nil
	       :documentation "Item be turn into divider")
   (data-icon :accessor data-icon
	      :initarg :data-icon
	      :initform nil
	      :documentation "Icon for display")
   (count-bubbles :accessor count-bubbles
		  :initarg :count-bubbles
		  :initform nil
		  :documentation "Add a count indicator to the right of the list item: 
text for display or nil - disable ")))

(defmethod render-begin ((widget WITEMLISTVIEWJQM))
  (concatenate 'string
	       "<li  "
	       (if (is-divider widget) " data-role='list-divider' ")
	       (if (data-icon widget) (concatenate 'string
						   " data-icon='"
						   (data-icon widget)		   
						   "' "))
	       " id='" (write-to-string (id widget)) "' >"))

(defmethod render-end  ((widget WITEMLISTVIEWJQM))
  (concatenate 'string
	       (if (count-bubbles widget)
		   (concatenate 'string
				"<span class='ui-li-count'>"
				(write-to-string (count-bubbles widget))
				"</span>"))
	       "</li>"))

(defclass WLISTVIEWJQM (WCONTAINERWIDGET)
  ((inset :accessor inset
	  :initarg :inset
	  :initform nil
	  :documentation "Applies the inset appearance")
   (data-filter :accessor data-filter
		:initarg :data-filter
		:initform nil
		:documentation "listview is filtered")
   (data-filter-reveal :accessor data-filter-reveal
		       :initarg :data-filter-reveal
		       :initform nil
		       :documentation "listview is filtered - autohide or not")
   (data-filter-placeholder :accessor data-filter-placeholder
			    :initarg :data-filter-placeholder
			    :initform nil
			    :documentation "Placeholder of filter")
   (data-autodividers :accessor data-autodividers
		      :initarg :data-autodividers
		      :initform nil
		      :documentation "listview is configured to automatically generate dividers")
   (ordered :accessor ordered
	    :initarg :ordered
	    :initform nil
	    :documentation "Items are a sequence")))

(defmethod render-begin ((widget WLISTVIEWJQM))
  (concatenate 'string
	       (if (ordered widget)
		   "<ol"		   
		   "<ul")
	       " data-role ='listview' "
	       (if (inset widget) " data-inset='true' ")
	       (if (data-filter widget) " data-filter='true' ")
	       (if (data-filter-placeholder widget) (concatenate 'string
								 " data-filter-placeholder='"
								 (data-filter-placeholder widget)
								 "' "))
	       (if (data-filter-reveal widget) " data-filter-reveal='true' ")
	       (if (data-autodividers widget) " data-autodividers='true' ")
	       " id='" (write-to-string (id widget)) "' >"))

(defmethod render-end  ((widget WLISTVIEWJQM))
  (if (ordered widget)
      "</ol>"
      "</ul>"))







