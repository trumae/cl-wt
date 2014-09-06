(in-package :cl-wt)

(defclass WPAGEJQM (WCONTAINERWIDGET)
  ((title :accessor title
	  :initarg :title
	  :initform nil
	  :documentation "Title of page")
   
   (theme :accessor theme
	  :initarg :theme
	  :initform "a"
	  :documentation "Predefined theme for app")
   (right-panel :accessor right-panel
		:initarg :right-panel
		:initform nil
		:documentation "Panel of right side")
   (left-panel :accessor left-panel
	       :initarg :left-panel
	       :initform nil
	       :documentation "Panel of left side")
   (main :accessor main
	 :initarg :main
	 :initform nil
	 :documentation "Content of page")
   (footer :accessor footer
	   :initarg :footer
	   :initform nil
	   :documentation "Footer of page")))

(defmethod render-begin ((widget WPAGEJQM))
  (concatenate 'string
  	       "<div data-role='page' id='"
	       (write-to-string (id widget))
	       "' data-theme='"
	       (theme widget)
	       "'>"))

(defmethod render-body ((widget WPAGEJQM))
  (concatenate 'string
	       (if (right-panel widget)
		   (render (right-panel widget)))
	       (if (left-panel widget)
		   (render (left-panel widget)))
	       (if (or (right-panel widget)
		       (left-panel widget)
		       (title widget))
		   (concatenate 'string
				"<div data-role='header'>"
				"<h1>" (title widget) "</h1>"			     
				(if (right-panel widget)
				    (concatenate 'string
						 "<a href='#"
						 (write-to-string (id (right-panel widget)))
						 "' data-icon='" (data-icon (right-panel widget))
						 "' data-iconpos='" (data-iconpos (right-panel widget))
						 "'>" (text-icon (right-panel widget)) "</a>"))
				(if (left-panel widget)
				    (concatenate 'string
						 "<a href='#"
						 (write-to-string (id (left-panel widget)))
						 "' data-icon='" (data-icon (left-panel widget))
						 "' data-iconpos='" (data-iconpos (left-panel widget))
						 "'>" (text-icon (left-panel widget)) "</a>"))
				"</div>"))
	       "<div role='main' class='ui-content' >"
	       (render-list (children widget))
	       "</div>"
	       (if (footer widget)
		   (concatenate 'string
				"<div data-role='footer'>"
				(render (footer widget))
				"</div>"))))
