# Dockerfile generated from generator/../images/python-3.6.def
FROM registry.opensuse.org/opensuse/tumbleweed

ARG BUILDID=0

LABEL org.opencontainers.image.title="Python 3.6 container"
LABEL org.opencontainers.image.description="Environment for Python 3.6"
LABEL org.opencontainers.image.version="3.6-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y --no-recommends openSUSE-release-appliance-docker

# For some inexplicable reasons, this will also pull in python38-base right now...
RUN zypper in -y python36-base python36-pip python36-setuptools python36-wheel

# no cleanup required
