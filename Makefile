all: latest
.PHONY: all build push

build:
	docker build . -t acl2s:latest

push:
	docker image tag acl2s:latest atwalter/acl2s:latest
	docker push atwalter/acl2s:latest
