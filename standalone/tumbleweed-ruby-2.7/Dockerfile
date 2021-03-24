# Dockerfile generated from generator/../images/ruby-2.7.def
FROM registry.opensuse.org/opensuse/tumbleweed

ARG BUILDID=0

LABEL org.opencontainers.image.title="Ruby 2.7 container"
LABEL org.opencontainers.image.description="Environment for Ruby 2.7"
LABEL org.opencontainers.image.version="2.7-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker


RUN zypper in -y ruby-2.7 ruby2.7-rubygem-bundler ruby-devel
RUN zypper in -y git-core patch make gcc


# no cleanup required
