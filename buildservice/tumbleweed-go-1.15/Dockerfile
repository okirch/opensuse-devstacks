# Dockerfile generated from generator/../images/go-1.15.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: opensuse/golang:1.15
#!BuildTag: opensuse/golang:%%PKG_VERSION%%
#!BuildTag: opensuse/golang:%%PKG_VERSION%%.%RELEASE%


FROM opensuse/tumbleweed

ARG BUILDID=0

# labelprefix=org.opensuse.golang
PREFIXEDLABEL org.opencontainers.image.title="GO 1.15 development container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for GO 1.15 development"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.opensuse.org/opensuse/golang:%%PKG_VERSION%%.%RELEASE%"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker

# Install packages
RUN zypper install -y --no-recommends go1.15 git-core

# no cleanup required
