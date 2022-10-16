SHELL := /bin/bash

### Tasks to build Docker images

build-base-env-docker-image:
	docker \
	    build \
	    --file Dockerfile.base \
	    --build-arg HOST_UID=$$(id -u) \
	    --build-arg HOST_GID="$$(id -g)" \
	    --tag mnist-demo-pipeline-base \
	    .
