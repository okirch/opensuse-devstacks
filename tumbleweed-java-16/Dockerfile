FROM opensuse/tumbleweed

ARG JAVA_VERSION
ARG BUILDID

LABEL org.opencontainers.image.title="Java $JAVA_VERSION development container"
LABEL org.opencontainers.image.description="Environment for Java $JAVA_VERSION development"
LABEL org.opencontainers.image.version="$JAVA_VERSION.$BUILDID"
# LABEL org.opensuse.reference="opensuse/java-devel:$JAVA_VERSION.$BUILDID"

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker

# Development packages
RUN zypper install -y --no-recommends java-$JAVA_VERSION-openjdk-devel maven git-core

