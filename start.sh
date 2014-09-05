#!/bin/bash 

#LISP="/home/trumae/lisp/ccl/lx86cl64 -K utf-8"
LISP="sbcl"
#LISP="/home/trumae/lisp/abcl/abcl-src-1.3.1/abcl" # not supported. problems with md5 library

${LISP} <<EOF
(pushnew #p"/home/trumae/lisp/cl-wt/" asdf:*central-registry*)
(ql:quickload :cl-wt)
(in-package :cl-wt)
(start-helloworld 8000)
(cl:sleep 1000000)
EOF


