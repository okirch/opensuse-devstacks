# Dockerfile generated from generator/../images/go-1.16.def
FROM registry.opensuse.org/opensuse/leap:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="GO 1.16 development container"
LABEL org.opencontainers.image.description="Environment for GO 1.16 development"
LABEL org.opencontainers.image.version="1.16-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker


# Development packages
RUN zypper install -y --no-recommends go1.16 git-core


# no cleanup required
