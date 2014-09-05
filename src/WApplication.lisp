(in-package :cl-wt)

(defclass WAPPLICATION (WWIDGET)
  ((app-root :accessor app-root
	:initarg :root
	:documentation "Top level widget container for this application")
   (style-sheets :accessor style-sheets
		 :initform '()
		 :documentation "List of style sheet for this appliction")
   (body-class :accessor body-class
	       :initform ""
	       :initarg :body-class
	       :documentation "Style sheet for entire page")
   (meta-header :accessor meta-header
		:initform '()
		:initarg :meta-header
		:documentation "List of meta values")
   (title :accessor title 
	  :initarg :title
	  :initform "cl-wt"
	  :documentation "Title of application")))

(defmethod init-wapplication ((app WAPPLICATION))
  (setf (app-root app) (make-instance 'WCONTAINERWIDGET)))

(defmethod script ((app WAPPLICATION))
    (concatenate 'string
		 "<script language='javascript'>"
		 
		 "function stopPropagation(event) {"
		 "  if(event.preventDefault) {"
		 "    event.stopPropagation();"
		 "  } else {"
		 "    event.cancelBubble = true;"
		 "  };"
		 "}"
		 "function getData() {"
		 "  var l = document.querySelectorAll('input');"
		 "  var text = '';"
		 "  for(i = 0; i < l.length; i++) {"
		 "    text += '<input name=\"' + l[i].name + '\" value=\"' + l[i].value + '\"/>'; "
		 "  }"
		 "  return text;"
		 "}"
		 (concatenate 'string				  
			      "function send(origin, event) {"
			      "  document.getElementById('wt-send-form').innerHTML = "
			      "    \"<input name='origin' value='\" + origin + \"' />\" + "
			      "    \"<input name='event' value='\" + event + \"' />\" + "
			      "    getData();"
			      "  document.getElementById('wt-send-form').submit();"
			      "}")
		 
		 (script (app-root app))
		 "</script>"))

(defmethod process-data ((app WAPPLICATION))
  (process-data (app-root app)))
    
(defmethod process-event ((app WAPPLICATION) origin event)
  (process-event (app-root app) origin event))

(defmethod script-imports ((app WAPPLICATION))
  "")

(defmethod style-imports ((app WAPPLICATION))
  "")

(defmethod render ((app WAPPLICATION))
  (let ((uuid (uuid:make-v4-uuid)))
    (concatenate 'string
		 "<!DOCTYPE html>"
		 "<html>"
		 "<head>"
		 "<meta charset='utf-8'>"
		 "<meta name='viewport' content='width=device-width, initial-scale=1'>"
		 "<title>" (title app)  "</title>"
		 (style-imports app)
		 (script-imports app)
		 "</head><body>"
		 (render (app-root app))

		 "<form style='display: none;' id='wt-send-form' action='/?t="
		 (write-to-string uuid)
		 "' method='POST'></form>"

		 "</body>"
		 (script app)
		 "</html>")))
  
