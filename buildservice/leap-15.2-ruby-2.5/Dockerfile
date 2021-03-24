# Dockerfile generated from generator/../images/ruby-2.5.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: _OBS_REGISTRY_NAMESPACE/python-devel:2.5
#!BuildTag: _OBS_REGISTRY_NAMESPACE/python-devel:%%PKG_VERSION%%
#!BuildTag: _OBS_REGISTRY_NAMESPACE/python-devel:%%PKG_VERSION%%.%RELEASE%


FROM opensuse/leap:15.2

ARG BUILDID=0

# labelprefix=org.opensuse.python-devel
PREFIXEDLABEL org.opencontainers.image.title="Ruby 2.5 container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for Ruby 2.5"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.opensuse.org/_OBS_REGISTRY_NAMESPACE/python-devel:%%PKG_VERSION%%.%RELEASE%"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker


RUN zypper in -y ruby-2.5 ruby2.5-rubygem-bundler ruby-devel
RUN zypper in -y git-core patch make gcc
# Actually, I'd like to back out
#    ruby2.5-make-gem-build-reproducible.patch
# because that breaks hoe. But reverting patches during container build
# is probably not a very nice thing to do.


# no cleanup required
