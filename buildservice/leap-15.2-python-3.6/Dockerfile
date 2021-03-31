# Dockerfile generated from generator/../images/python-3.6.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: _OBS_REGISTRY_NAMESPACE/python-devel:3.6
#!BuildTag: _OBS_REGISTRY_NAMESPACE/python-devel:%%PKG_VERSION%%
#!BuildTag: _OBS_REGISTRY_NAMESPACE/python-devel:%%PKG_VERSION%%.%RELEASE%


FROM opensuse/leap:15.2

ARG BUILDID=0

# labelprefix=org.opensuse.python-devel
PREFIXEDLABEL org.opencontainers.image.title="Python 3.6 container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for Python 3.6"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.opensuse.org/_OBS_REGISTRY_NAMESPACE/python-devel:%%PKG_VERSION%%.%RELEASE%"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y --no-recommends openSUSE-release-appliance-docker

RUN zypper in -y python3-base python3-pip python3-setuptools python3-wheel

# pip package is woefully outdated
RUN pip3 install --upgrade pip

# no cleanup required
