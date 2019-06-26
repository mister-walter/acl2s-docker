all: latest
.PHONY: all latest

latest:
	docker build . -t acl2s:latest --build-arg ACL2_REPO_LATEST_COMMIT=$(shell curl --silent https://api.github.com/repos/acl2/acl2/commits/master | jq -r .sha)

push-latest: latest
	docker image tag acl2s:latest atwalter/acl2s:latest
	docker push atwalter/acl2s:latest
