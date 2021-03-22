FROM opensuse/tumbleweed

ARG PYTHON_VERSION
ARG BUILDID

LABEL org.opencontainers.image.title="Python $PYTHON_VERSION runtime container"
LABEL org.opencontainers.image.description="Environment providing Python $PYTHON_VERSION runtime"
LABEL org.opencontainers.image.version="$PYTHON_VERSION-$BUILDID"

RUN zypper in -y python38-base python38-pip python38-setuptools python38-wheel

ENTRYPOINT [ "/bin/bash" ]
