(in-package :cl-wt)

(defvar *app-helloworldJQM* nil)

(defclass app-helloworldJQM (WAPPLICATIONJQM)
  ((title :initform "Hello World JQM!")))

(defmethod init-wapplication ((wapp app-helloworldjqm))
  (let* ((r1 (make-instance 'WPAGEJQM :title "HelloWorldJQM"))
	(btn1 (make-instance 'WPUSHBUTTON :text "Push me!"))
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

(defun start-helloworld-jqm(port)
  (if (null *app-helloworld*)
      (progn
	(setf *app-type* 'app-helloworldjqm)
	(setf *app-helloworldjqm*
	      (hunchentoot:start (make-instance 'hunchentoot:easy-acceptor
						:port port
						:address "0.0.0.0"))))
      (format t "Server is running...")))

(defun stop-helloworld-jqm()
  (hunchentoot:stop *app-helloworld*)
  (setf *app-helloworld* nil))
