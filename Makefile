all: build
.PHONY: all build push

IMAGE_VERSION ?= latest
LOCAL_IMAGE_NAME ?= acl2s
REMOTE_IMAGE_NAME ?= atwalter/acl2s
DOCKERFILE ?= Dockerfile

build:
	docker build . -t $(LOCAL_IMAGE_NAME):$(IMAGE_VERSION) -f $(DOCKERFILE)

push:
	docker image tag $(LOCAL_IMAGE_NAME):$(IMAGE_VERSION) $(REMOTE_IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(REMOTE_IMAGE_NAME):$(IMAGE_VERSION)
