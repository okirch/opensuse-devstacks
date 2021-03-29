# Dockerfile generated from generator/../images/ruby-2.7.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: opensuse/python-devel:2.7
#!BuildTag: opensuse/python-devel:%%PKG_VERSION%%
#!BuildTag: opensuse/python-devel:%%PKG_VERSION%%.%RELEASE%


FROM opensuse/tumbleweed

ARG BUILDID=0

# labelprefix=org.opensuse.python-devel
PREFIXEDLABEL org.opencontainers.image.title="Ruby 2.7 container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for Ruby 2.7"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.opensuse.org/opensuse/python-devel:%%PKG_VERSION%%.%RELEASE%"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker


# Install packages
RUN zypper install -y --no-recommends ruby-2.7 ruby2.7-rubygem-bundler ruby-devel git-core patch make gcc


# no cleanup required
