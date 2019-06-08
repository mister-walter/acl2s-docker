#!/bin/bash
cd /root/acl2
make LISP="ros run"
cd books
make acl2s ACL2=/root/acl2/saved_acl2 -j 4
make xdoc ACL2=/root/acl2/saved_acl2 -j 4


