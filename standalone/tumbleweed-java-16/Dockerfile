# Dockerfile generated from generator/../images/java-16.def
FROM registry.opensuse.org/opensuse/tumbleweed

ARG BUILDID=0

LABEL org.opencontainers.image.title="Java 16 development container"
LABEL org.opencontainers.image.description="Development environment for Java 16"
LABEL org.opencontainers.image.version="16-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y --no-recommends openSUSE-release-appliance-docker

# Install packages
RUN zypper install -y --no-recommends java-16-openjdk-devel maven git-core

# no cleanup required
