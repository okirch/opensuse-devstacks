# Dockerfile generated from generator/../images/python-3.8.def
FROM registry.opensuse.org/opensuse/leap:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="Python 3.8 container"
LABEL org.opencontainers.image.description="Environment for Python 3.8"
LABEL org.opencontainers.image.version="3.8-$BUILDID"

# Add extra repositories
RUN zypper ar --refresh https://download.opensuse.org/repositories/home:/okir:/devstacks/openSUSE_Leap_15.2/home:okir:devstacks.repo

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker

# Install packages
RUN zypper install -y --no-recommends python38-base python38-pip python38-setuptools python38-wheel

# no cleanup required
