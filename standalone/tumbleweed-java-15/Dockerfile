# Dockerfile generated from generator/../images/java-15.def
FROM registry.opensuse.org/opensuse/tumbleweed

ARG BUILDID=0

LABEL org.opencontainers.image.title="Java 15 development container"
LABEL org.opencontainers.image.description="Development environment for Java 15"
LABEL org.opencontainers.image.version="15-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y --no-recommends openSUSE-release-appliance-docker

# Install packages
RUN zypper install -y --no-recommends java-15-openjdk-devel maven git-core

# no cleanup required
