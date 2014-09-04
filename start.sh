#!/bin/bash 

LISP="/home/trumae/lisp/ccl/lx86cl64 -K utf-8"

${LISP} <<EOF
(pushnew #p"/home/trumae/lisp/cl-wt/" asdf:*central-registry*)
(ql:quickload :cl-wt)
(in-package :cl-wt)
(start-helloworld 8000)
(cl:sleep 1000000)
EOF


