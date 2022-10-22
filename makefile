.PHONY: *
SHELL := /bin/bash

build-docker-image:
	(cd docker; make build-docker-image)

# override when invoking make, eg "make RUN_ENVIRONMENT=ci ..."
RUN_ENVIRONMENT ?= "dev"

run[in-base-docker]:
	docker run --rm --tty \
	    --env RUN_ENVIRONMENT=$(RUN_ENVIRONMENT) \
	    $(EXTRA_FLAGS) \
	    --volume $$(pwd)/workspace:/home/host_user/workspace \
	    --volume $$(pwd)/pipeline-outputs:/pipeline-outputs \
	    --workdir /home/host_user/workspace/ \
	    mnist-demo-pipeline-base \
	    "$(COMMAND)"

docker-run-in-cicd:
	docker run --rm --tty \
	    --env RUN_ENVIRONMENT=$(RUN_ENVIRONMENT) \
	    $(EXTRA_FLAGS) \
	    --volume $$(pwd)/workspace:/home/host_user/workspace \
	    --volume $$(pwd)/pipeline-outputs:/pipeline-outputs \
	    --workdir /home/host_user/workspace/ \
	    mnist-demo-pipeline-cicd \
	    "$(COMMAND)"
