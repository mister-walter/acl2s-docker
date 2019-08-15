all: latest
.PHONY: all build push

build:
	docker build . -t acl2s:8.2

push:
	docker image tag acl2s:8.2 atwalter/acl2s:8.2
	docker push atwalter/acl2s:8.2
