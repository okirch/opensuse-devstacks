# Dockerfile generated from generator/../images/ruby-2.5.def
FROM registry.opensuse.org/opensuse/leap:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="Ruby 2.5 container"
LABEL org.opencontainers.image.description="Environment for Ruby 2.5"
LABEL org.opencontainers.image.version="2.5-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker


RUN zypper in -y ruby-2.5 ruby2.5-rubygem-bundler ruby-devel
RUN zypper in -y git-core patch make gcc
# Actually, I'd like to back out
#    ruby2.5-make-gem-build-reproducible.patch
# because that breaks hoe. But reverting patches during container build
# is probably not a very nice thing to do.

# no cleanup required
