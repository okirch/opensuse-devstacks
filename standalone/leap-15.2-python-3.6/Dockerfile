# Dockerfile generated from generator/../images/python-3.6.def
FROM registry.opensuse.org/opensuse/leap:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="Python 3.6 container"
LABEL org.opencontainers.image.description="Environment for Python 3.6"
LABEL org.opencontainers.image.version="3.6-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker


RUN zypper in -y python3-base python3-pip python3-setuptools python3-wheel

# pip package is woefully outdated
RUN pip3 install --upgrade pip

# no cleanup required
