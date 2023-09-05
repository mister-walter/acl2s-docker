# ACL2s Docker Image

## M1/M2 Macs
Be aware that the prebuilt Docker image is known to have issues on non-Intel macOS machines. It will work correctly if the [base ACL2 Docker image](https://github.com/mister-walter/acl2-docker) is rebuilt from scratch on an M1/M2 machine, and the ACL2s image is built on top of this new image.

## Notes
By default, certification is done with 4 parallel tasks. This can be changed by overriding the `ACL2_CERTIFY_OPTS` build argument. (i.e. using `docker build --build-arg ACL2_CERTIFY_OPTS="-j 2"`)
