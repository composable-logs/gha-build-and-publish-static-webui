FROM ubuntu:20.04

ENV DEBIAN_FRONTEND "noninteractive"

RUN apt-get -qq -y update && \
    apt-get -qq -y upgrade && \
    apt-get -qq -y install --no-install-recommends \
        python3 \
        python3-pip \
        make

RUN groupadd host_user_group  && \
    useradd -rm --shell /bin/bash host_user

USER host_user

ENTRYPOINT ["/bin/bash", "-c"]
