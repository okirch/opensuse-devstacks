# Dockerfile generated from generator/../images/java-16.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: opensuse/openjdk:16
#!BuildTag: opensuse/openjdk:%%PKG_VERSION%%
#!BuildTag: opensuse/openjdk:%%PKG_VERSION%%.%RELEASE%


FROM opensuse/tumbleweed

ARG BUILDID=0

# labelprefix=org.opensuse.openjdk
PREFIXEDLABEL org.opencontainers.image.title="Java 16 development container"
PREFIXEDLABEL org.opencontainers.image.description="Development environment for Java 16"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.opensuse.org/opensuse/openjdk:%%PKG_VERSION%%.%RELEASE%"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y --no-recommends openSUSE-release-appliance-docker

# Install packages
RUN zypper install -y --no-recommends java-16-openjdk-devel maven git-core

# no cleanup required
