# Dockerfile generated from generator/../images/go-1.15.def
FROM registry.opensuse.org/opensuse/tumbleweed

ARG BUILDID=0

LABEL org.opencontainers.image.title="GO 1.15 development container"
LABEL org.opencontainers.image.description="Environment for GO 1.15 development"
LABEL org.opencontainers.image.version="1.15-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker


# Install packages
RUN zypper install -y --no-recommends go1.15 git-core


# no cleanup required
