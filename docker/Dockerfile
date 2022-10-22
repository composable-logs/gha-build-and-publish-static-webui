FROM ubuntu:20.04

USER root

# --- install base dependencies ---

ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    apt-get -qq -y install --no-install-recommends \
        python3 \
        python3-pip \
        make


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


# --- install Python command line tool ---

USER host_user

# The below ensures that pip-installed command line tools are in path
ENV PATH "/home/host_user/.local/bin:$PATH"

RUN pip install --user pynb-dag-runner-snapshot==0.0.8.dev1665829343


# --- install gha entrypoint script ---

USER root

COPY gha-entrypoint.sh /home/host_user/

RUN chmod +x /home/host_user/gha-entrypoint.sh


# --- set username, default directory and 'docker run' entrypoint ---

USER host_user
WORKDIR /home/host_user/

ENTRYPOINT ["/home/host_user/gha-entrypoint.sh"]
