FROM opensuse/tumbleweed

ARG PYTHON_VERSION
ARG BUILDID

LABEL org.opencontainers.image.title="Python $PYTHON_VERSION runtime container"
LABEL org.opencontainers.image.description="Environment providing Python $PYTHON_VERSION runtime"
LABEL org.opencontainers.image.version="$PYTHON_VERSION-$BUILDID"

# For some inexplicable reasons, this will also pull in python38-base right now...
RUN zypper in -y python36-base python36-pip python36-setuptools python36-wheel

ENTRYPOINT [ "/bin/bash" ]
