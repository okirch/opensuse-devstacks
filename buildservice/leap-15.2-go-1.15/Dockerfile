# Dockerfile generated from generator/../images/go-1.15.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: _OBS_REGISTRY_NAMESPACE/go-devel:1.15
#!BuildTag: _OBS_REGISTRY_NAMESPACE/go-devel:%%PKG_VERSION%%
#!BuildTag: _OBS_REGISTRY_NAMESPACE/go-devel:%%PKG_VERSION%%.%RELEASE%


FROM opensuse/leap:15.2

ARG BUILDID=0

# labelprefix=org.opensuse.go-devel
PREFIXEDLABEL org.opencontainers.image.title="GO 1.15 development container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for GO 1.15 development"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.opensuse.org/_OBS_REGISTRY_NAMESPACE/go-devel:%%PKG_VERSION%%.%RELEASE%"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker


# Install packages
RUN zypper install -y --no-recommends go1.15 git-core


# no cleanup required
