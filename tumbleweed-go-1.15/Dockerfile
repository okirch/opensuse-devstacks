FROM opensuse/tumbleweed

ARG GO_VERSION
ARG BUILDID

LABEL org.opencontainers.image.title="GO $GO_VERSION development container"
LABEL org.opencontainers.image.description="Environment for GO $GO_VERSION development"
LABEL org.opencontainers.image.version="$GO_VERSION-$BUILDID"
# LABEL org.opensuse.reference="opensuse/go-devel:$GO_VERSION-$BUILDID"

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker

# Development packages
RUN zypper install -y --no-recommends go$GO_VERSION git-core

