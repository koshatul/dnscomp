GIT_HASH ?= $(shell git show -s --format=%h)
GIT_TAG ?= $(shell git tag -l --merged $(GIT_HASH) | tail -n1)
APP_VERSION ?= $(if $(TRAVIS_TAG),$(TRAVIS_TAG),$(if $(GIT_TAG),$(GIT_TAG),$(GIT_HASH)))
APP_DATE ?= $(shell date -u +"%Y-%m-%dT%H:%M:%SZ")

.PHONY: docker-lint
docker-lint:
	cat Dockerfile | docker run --rm -i hadolint/hadolint:latest

.PHONY: docker
docker:
	docker build -t koshatul/dnscomp:$(APP_VERSION) .
