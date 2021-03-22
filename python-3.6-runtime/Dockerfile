FROM opensuse/leap:latest

ARG PYTHON_VERSION
ARG BUILDID

LABEL org.opencontainers.image.title="Python $PYTHON_VERSION runtime container"
LABEL org.opencontainers.image.description="Environment providing Python $PYTHON_VERSION runtime"
LABEL org.opencontainers.image.version="$PYTHON_VERSION.$BUILDID"

RUN zypper in -y python3-base python3-pip python3-setuptools python3-wheel

# pip package is woefully outdated
RUN pip3 install --upgrade pip
ENTRYPOINT [ "/bin/bash" ]
