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
   (header :accessor header
	   :initarg :header
	   :initform nil
	   :documentation "Header of page")
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
	       (if (or (header widget) (title widget))
		   (concatenate 'string
				"<div data-role='header'>"
				"<h1>" (title widget) "</h1>"			     
				(if (header widget)
				    (render (header widget)))
				"</div>"))
	       "<div role='main' class='ui-content' >"
	       (render-list (children widget))
	       "</div>"
	       (if (footer widget)
		   (concatenate 'string
				"<div data-role='footer'>"
				(render (footer widget))
				"</div>"))))
