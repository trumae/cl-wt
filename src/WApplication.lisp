(in-package :cl-wt)

(defclass WAPPLICATION (WOBJECT)
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
  (let ((uuid (uuid:make-v4-uuid)))
    (concatenate 'string
		 "<script language='javascript'>"
		 "function send() {"
		 " document.location = '/?ttt=" (write-to-string uuid) "';"
		 "}"
		 (script (app-root app))
		 "</script>")))
	       
(defmethod render ((app WAPPLICATION))
  (concatenate 'string
	       "<!DOCTYPE html>"
	       "<html>"
	       "<head>"
	       "<meta charset='utf-8'>"
	       "<meta name='viewport' content='width=device-width, initial-scale=1'>"
	       "<title>" (title app)  "</title>"
	       "</head><body>"
	       (render (app-root app))
	       "</body>"
	       (script app)
	       "</html>"))
