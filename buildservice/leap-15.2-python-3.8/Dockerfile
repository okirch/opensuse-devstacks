# Dockerfile generated from generator/../images/python-3.8.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: _OBS_REGISTRY_NAMESPACE/python-devel:3.8
#!BuildTag: _OBS_REGISTRY_NAMESPACE/python-devel:%%PKG_VERSION%%
#!BuildTag: _OBS_REGISTRY_NAMESPACE/python-devel:%%PKG_VERSION%%.%RELEASE%


FROM opensuse/leap:15.2

ARG BUILDID=0

# labelprefix=org.opensuse.python-devel
PREFIXEDLABEL org.opencontainers.image.title="Python 3.8 container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for Python 3.8"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.opensuse.org/_OBS_REGISTRY_NAMESPACE/python-devel:%%PKG_VERSION%%.%RELEASE%"

# Add extra repositories
RUN zypper addrepo --refresh --no-gpgcheck https://download.opensuse.org/repositories/home:/okir:/devstacks/openSUSE_Leap_15.2/home:okir:devstacks.repo
RUN zypper refresh


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y --no-recommends openSUSE-release-appliance-docker

# Install packages
RUN zypper install -y --no-recommends python38-base python38-pip python38-setuptools python38-wheel

# no cleanup required
