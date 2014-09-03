(in-package :cl-wt)

(defvar *app-type* 'WAPPLICATION)

(defun adapter-hunchentoot-logout()
  (let ((session (hunchentoot:start-session)))
    (setf (hunchentoot:session-value 'app) nil)))
	  
(defun adapter-hunchentoot()
  (let ((session (hunchentoot:start-session)))
    (setf (hunchentoot:session-max-time session) 172800)
    (if (null (hunchentoot:session-value 'app))
	(progn
	  (setf (hunchentoot:session-value 'app)
		(make-instance *app-type*))
	  (init-wapplication (hunchentoot:session-value 'app))))
    (let ((app (hunchentoot:session-value 'app)))
      (progn
	(process-event app
		       (hunchentoot:post-parameter "origin")
		       (hunchentoot:post-parameter "event")
		       (hunchentoot:post-parameter "data"))
	(render app)))))
    
    
    
