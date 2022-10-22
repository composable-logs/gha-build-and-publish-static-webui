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
