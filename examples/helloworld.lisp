(in-package :cl-wt)

(defvar *app-helloworld* nil)

(defclass app-helloworld (WAPPLICATION)
  ((title :initform "Hello World!")))

(defmethod init-wapplication ((wapp WAPPLICATION))
  (let ((r1 (make-instance 'WCONTAINERWIDGET))
	(btn1 (make-instance 'WPUSHBUTTON :text "Push me!" :clicked (lambda()(format t "clicked"))))
	(input1 (make-instance 'WINPUTLINE))
	(t1 (make-instance 'WTEXT :text "Nome"))
	(t2 (make-instance 'WTEXT :text "")))
    (setf (clicked btn1) (lambda ()			   
			   (setf (text t2) (format nil "Hello World ~a" (text input1)))))
    (add-widget r1 t1)
    (add-widget r1 input1)
    (add-widget r1 btn1)
    (add-widget r1 t2)
    (setf (app-root wapp) r1)))

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
