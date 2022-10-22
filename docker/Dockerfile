FROM ubuntu:20.04

# --- install base dependencies ---

ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    apt-get -qq -y install --no-install-recommends \
        python3 \
        python3-pip \
        make

# The below ensures that pip-installed command line tools are in path
ENV PATH "/home/root/.local/bin:$PATH"

ENTRYPOINT ["/bin/bash", "-c"]
