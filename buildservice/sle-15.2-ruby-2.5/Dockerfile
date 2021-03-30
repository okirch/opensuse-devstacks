# Dockerfile generated from generator/../images/ruby-2.5.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: suse/sles/15.2/python-devel:2.5
#!BuildTag: suse/sles/15.2/python-devel:%%PKG_VERSION%%
#!BuildTag: suse/sles/15.2/python-devel:%%PKG_VERSION%%.%RELEASE%


FROM suse/sle15:15.2

ARG BUILDID=0

# labelprefix=com.suse.python-devel
PREFIXEDLABEL org.opencontainers.image.title="Ruby 2.5 container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for Ruby 2.5"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.suse.com/suse/sles/15.2/python-devel:%%PKG_VERSION%%.%RELEASE%"



RUN mv /etc/zypp /etc/zypp.save
ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN ln -sf /run/secrets/scc_credentials /etc/zypp/credentials.d/SCCcredentials

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN --mount=type=secret,id=scc_credentials \
  zypper install -y --no-recommends sles-release


RUN zypper in -y ruby-2.5 ruby2.5-rubygem-bundler ruby-devel
RUN zypper in -y git-core patch make gcc
# Actually, I'd like to back out
#    ruby2.5-make-gem-build-reproducible.patch
# because that breaks hoe. But reverting patches during container build
# is probably not a very nice thing to do.


RUN rm -rf /etc/zypp
RUN mv /etc/zypp.save /etc/zypp

