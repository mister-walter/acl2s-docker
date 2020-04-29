all: build
.PHONY: all build push

build:
	docker build . -t acl2s:8.3

push:
	docker image tag acl2s:8.3 atwalter/acl2s:8.3
	docker push atwalter/acl2s:8.3
