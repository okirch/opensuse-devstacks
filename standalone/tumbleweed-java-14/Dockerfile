# Dockerfile generated from generator/../images/java-14.def
FROM registry.opensuse.org/opensuse/tumbleweed

ARG BUILDID=0

LABEL org.opencontainers.image.title="Java 14 development container"
LABEL org.opencontainers.image.description="Development environment for Java 14"
LABEL org.opencontainers.image.version="14-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y --no-recommends openSUSE-release-appliance-docker

# Install packages
RUN zypper install -y --no-recommends java-14-openjdk-devel maven git-core

# no cleanup required
