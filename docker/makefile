SHELL             := /bin/bash
DOCKER_IMAGE_NAME := gha-docker-environment

build-docker-image:
	docker build \
	    --file Dockerfile \
	    --tag $(DOCKER_IMAGE_NAME) \
	    .
