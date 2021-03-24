# Dockerfile generated from generator/../images/java-15.def
FROM registry.opensuse.org/opensuse/tumbleweed

ARG BUILDID=0

LABEL org.opencontainers.image.title="Java 15 development container"
LABEL org.opencontainers.image.description="Environment for Java 15 development"
LABEL org.opencontainers.image.version="15-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker


# Development packages
RUN zypper install -y --no-recommends java-15-openjdk-devel maven git-core


# no cleanup required
