(in-package :cl-wt)

(defvar *app-helloworldJQM* nil)

(defclass app-helloworldJQM (WAPPLICATIONJQM)
  ((title :initform "Hello World JQM!")))

(defmethod init-wapplication ((wapp app-helloworldjqm))
  (let* ((rpanel (make-instance 'WPANELJQM))
	 (lpanel (make-instance 'WPANELJQM :data-iconpos "" :text-icon "Login" :data-position "right"))
	 (r1 (make-instance 'WPAGEJQM :title "HelloWorldJQM" :right-panel rpanel :left-panel lpanel))
	 (btn1 (make-instance 'WPUSHBUTTON :text "Push me!"
			      ;:data-icon "ui-icon-arrow-d-l"
					;:data-iconpos "ui-btn-icon-left"
			      ))
	 (input1 (make-instance 'WINPUTLINE))
	 (lv (make-instance 'WLISTVIEWJQM :inset T :data-filter T
			    :data-filter-placeholder "Busca..."))
	 (t1 (make-instance 'WTEXT :text "Nome"))
	 (t2 (make-instance 'WTEXT :text ""))
	 (item1 (make-instance 'WITEMLISTVIEWJQM :is-divider T))
	 (item2 (make-instance 'WITEMLISTVIEWJQM :data-icon "gear" :count-bubbles 10))
	 (textoitem1 (make-instance 'WTEXT :text "Titulo"))
	 (textoitem2 (make-instance 'WANCHOR :href "http://www.google.com/" :text "Google")))
    (setf (clicked btn1) (lambda ()			   
			   (setf (text t2) (format nil "Hello World ~a" (text input1)))))
    (add-widget r1 t1)
    (add-widget r1 input1)
    (add-widget r1 btn1)
    (add-widget r1 t2)
    (add-widget r1 lv)

    (add-widget item1 textoitem1)
    (add-widget item2 textoitem2)
    (add-widget lv item1)
    (add-widget lv item2)
    
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
