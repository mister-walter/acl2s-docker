all: build
.PHONY: all build push push-ghcr

IMAGE_VERSION ?= latest
LOCAL_IMAGE_NAME ?= acl2s
REMOTE_IMAGE_NAME ?= atwalter/acl2s
DOCKERFILE ?= Dockerfile

build:
	docker build . -t $(LOCAL_IMAGE_NAME):$(IMAGE_VERSION) -f $(DOCKERFILE)

push:
	docker image tag $(LOCAL_IMAGE_NAME):$(IMAGE_VERSION) $(REMOTE_IMAGE_NAME):$(IMAGE_VERSION)
	docker push $(REMOTE_IMAGE_NAME):$(IMAGE_VERSION)

push-ghcr:
	docker image tag $(LOCAL_IMAGE_NAME):$(IMAGE_VERSION) ghcr.io/mister-walter/$(LOCAL_IMAGE_NAME):$(IMAGE_VERSION)
	docker push ghcr.io/mister-walter/$(LOCAL_IMAGE_NAME):$(IMAGE_VERSION)
