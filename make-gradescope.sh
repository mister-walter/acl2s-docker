#!/bin/bash

export IMAGE_VERSION=cs2800fa23
sed "s|FROM atwalter/acl2:latest|FROM atwalter/acl2_gradescope_autograder:$IMAGE_VERSION|g" Dockerfile > Dockerfile-gradescope
export LOCAL_IMAGE_NAME=acl2s_gradescope_autograder
export REMOTE_IMAGE_NAME=atwalter/acl2s_gradescope_autograder
export DOCKERFILE=Dockerfile-gradescope

make build
make push
rm Dockerfile-gradescope
