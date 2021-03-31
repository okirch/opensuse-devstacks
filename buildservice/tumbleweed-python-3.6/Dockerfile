# Dockerfile generated from generator/../images/python-3.6.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: opensuse/python-devel:3.6
#!BuildTag: opensuse/python-devel:%%PKG_VERSION%%
#!BuildTag: opensuse/python-devel:%%PKG_VERSION%%.%RELEASE%


FROM opensuse/tumbleweed

ARG BUILDID=0

# labelprefix=org.opensuse.python-devel
PREFIXEDLABEL org.opencontainers.image.title="Python 3.6 container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for Python 3.6"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.opensuse.org/opensuse/python-devel:%%PKG_VERSION%%.%RELEASE%"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker

# For some inexplicable reasons, this will also pull in python38-base right now...
RUN zypper in -y python36-base python36-pip python36-setuptools python36-wheel

# no cleanup required
