#|
  This file is a part of cl-wt project.
  Copyright (c) 2014 vvmaciel (vvmaciel@outlook.com)
|#

#|
  Author: vvmaciel (vvmaciel@outlook.com)
|#

(in-package :cl-user)
(defpackage cl-wt-asd
  (:use :cl :asdf))
(in-package :cl-wt-asd)

(defsystem cl-wt
  :version "0.1"
  :author "vvmaciel"
  :license "LGPL"
  :depends-on (:hunchentoot
	       :ironclad
	       :cl-who
	       :uuid
	       :sanitize
	       :parenscript
	       :iterate
	       :css-lite)
  :components ((:module "src"
			:components			
			((:file "package")
			 (:file "utils")
			 (:file "WString")
			 (:file "WApplication")
			 (:file "WWidget")
			 (:file "WContainerWidget")
			 (:file "WText")
			 (:file "WPushButton")
			 (:file "WInputLine")
			 (:file "AdapterHunchentoot")			 
			 (:module "jqm"
				  :components
				  ((:file "WApplicationJQM")
				   (:file "WPageJQM")
				   (:file "WPanelJQM")
				   (:file "WPushButtonJQM")))))
	       (:module "examples"
			:components
			((:file "helloworld")
			 (:file "helloworldJQM"))))
  :description "Web app library inspired in C++ library Wt"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op cl-wt-test))))
