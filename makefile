.PHONY: *
SHELL := /bin/bash

build-docker-image:
	(cd docker; make build-docker-image)

in-docker/run-command:
	( \
	    cd docker; \
	    make run-command \
	        DOCKER_EXTRA_FLAGS="${DOCKER_EXTRA_FLAGS}" \
	        DOCKER_COMMAND="${DOCKER_COMMAND}"; \
	)
