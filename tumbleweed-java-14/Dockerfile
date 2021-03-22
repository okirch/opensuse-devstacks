# Defines the tag for OBS and build script builds:
#!BuildTag: opensuse/java-devel:14
#!BuildTag: opensuse/java-devel:%%PKG_VERSION%%
#!BuildTag: opensuse/java-devel:%%PKG_VERSION%%.%RELEASE%

FROM opensuse/tumbleweed

ARG JAVA_VERSION

# labelprefix=org.opensuse.java-devel
LABEL org.opencontainers.image.title="Java $JAVA_VERSION development container"
# PREFIXEDLABEL org.opencontainers.image.description="Environment for Java $JAVA_VERSION development"
# PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
# PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
# PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
# PREFIXEDLABEL org.opensuse.reference="opensuse/java-devel:%%PKG_VERSION%%.%RELEASE%"

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker

# Development packages
RUN zypper install -y --no-recommends java-$JAVA_VERSION-openjdk-devel maven git-core

