# ACL2s Docker Image

## Apple Silicon Macs

This image is now built and distributed as a multi-platform Docker image. This means that both a `linux/amd64` and `linux/arm64` version of the image are built, and Docker should automatically use the appropriate version for your computer's architecture.

## Notes

By default, certification is done with 4 parallel tasks. This can be changed by overriding the `ACL2_CERT_JOBS` variable of the Makefile. For example, to use 2 tasks instead, run `make build ACL2_CERT_JOBS=2`.

To provide additional arguments to the `make` command that will be used to build ACL2's books, you can override the `ACL2_CERTIFY_OPTS` variable of the Makefile. Notice that this will override the effects of the `ACL2_CERT_JOBS` variable, so you will need to provide the appropriate `-j` option in that case.

## Updating the Gradescope image
To update the Gradescope Docker image, you first need to update the corresponding acl2-docker image. Then, update the IMAGE_VERSION value in make-gradescope.sh to match whatever was used in the acl2-docker's make-gradescope.sh script.
