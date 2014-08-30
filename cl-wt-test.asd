#|
  This file is a part of cl-wt project.
  Copyright (c) 2014 vvmaciel (vvmaciel@outlook.com)
|#

(in-package :cl-user)
(defpackage cl-wt-test-asd
  (:use :cl :asdf))
(in-package :cl-wt-test-asd)

(defsystem cl-wt-test
  :author "vvmaciel"
  :license "LGPL"
  :depends-on (:cl-wt
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:test-file "cl-wt"))))

  :defsystem-depends-on (:cl-test-more)
  :perform (test-op :after (op c)
                    (funcall (intern #. (string :run-test-system) :cl-test-more)
                             c)
                    (asdf:clear-system c)))
