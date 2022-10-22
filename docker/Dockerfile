FROM ubuntu:20.04

ARG HOST_GID
ARG HOST_UID

ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    apt-get -qq -y install --no-install-recommends \
        python3 \
        python3-pip \
        make

# Add user with same GID and UID as host user, so we can write files mounted into a container.
# This is only needed in dev-setup.
RUN groupadd --gid $HOST_GID host_user_group && \
    useradd --uid $HOST_UID --gid $HOST_GID -rm --shell /bin/bash host_user

USER host_user

ENTRYPOINT ["/bin/bash", "-c"]
