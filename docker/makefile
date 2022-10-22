.PHONY: *

SHELL             := /bin/bash
DOCKER_IMAGE_NAME := gha-docker-environment

build-docker-image:
	docker build \
	    --file Dockerfile \
	    --build-arg HOST_UID=$$(id -u) \
	    --build-arg HOST_GID="$$(id -g)" \
	    --tag ${DOCKER_IMAGE_NAME} \
	    .

run-command:
	docker run \
	    --rm --tty --rm \
	    ${DOCKER_EXTRA_FLAGS} \
	    ${DOCKER_IMAGE_NAME} \
	    "$(DOCKER_COMMAND)"
