(in-package :cl-wt)

(defvar *app-helloworld* nil)

(defclass app-helloworld (WAPPLICATION)
  ((title :initform "Hello World!")))

(defmethod init-wapplication ((wapp WAPPLICATION))
  (setf (app-root wapp) (make-instance 'WCONTAINERWIDGET)))

(setq hunchentoot:*dispatch-table*
      (list
       (hunchentoot:create-regex-dispatcher "^/$" 'adapter-hunchentoot)
       (hunchentoot:create-regex-dispatcher "^/logout$" 'adapter-hunchentoot-logout)))

(defun start-helloworld(port)
  (if (null *app-helloworld*)
      (progn
	(setf *app-type* 'app-helloworld)
	(setf *app-helloworld*
	      (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor
						:port port
						:address "0.0.0.0"))))
      (format t "Server is running...")))

(defun stop-helloworld()
  (hunchentoot:stop *app-helloworld*)
  (setf *app-helloworld* nil))