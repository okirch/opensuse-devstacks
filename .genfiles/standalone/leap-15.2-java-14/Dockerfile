# Dockerfile generated from generator/../images/java-14.def
FROM registry.opensuse.org/opensuse/leap:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="Java 14 development container"
LABEL org.opencontainers.image.description="Environment for Java 14 development"
LABEL org.opencontainers.image.version="14-$BUILDID"

# no setup required

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker

# Development packages
RUN zypper install -y --no-recommends java-14-openjdk-devel maven git-core


# no cleanup required
