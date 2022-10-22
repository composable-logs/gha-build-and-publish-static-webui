FROM ubuntu:20.04

ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    apt-get -qq -y install --no-install-recommends \
        python3 \
        python3-pip \
        make && \
    pip install --user pynb-dag-runner-snapshot==0.0.8.dev1665829343

# --- add non-root user `host_user` ---

ARG HOST_GID
ARG HOST_UID

#
# If HOST_GID and HOST_UID are provided:
#   Add host_user with provided GID and UID.
#   This is only needed in dev-setup so we can write files mounted into a container.
#
# Otherwise:
#   use default GID and UID
#
RUN if [ "$HOST_GID" = "" ] || [ "$HOST_UID" = "" ]; then \
        echo " *** Creating user host_user ..."; \
        useradd -rm --shell /bin/bash host_user; \
    else \
        echo " *** Creating user host_user with UID=${HOST_UID} and GID=${HOST_GID} ..."; \
        groupadd --gid $HOST_GID host_user_group; \
        useradd --uid $HOST_UID --gid $HOST_GID -rm --shell /bin/bash host_user; \
    fi

# -- install gha entrypoint script

COPY gha-entrypoint.sh /home/host_user/

RUN chmod u+x /home/host_user/gha-entrypoint.sh

USER host_user

ENTRYPOINT ["/home/host_user/gha-entrypoint.sh"]
