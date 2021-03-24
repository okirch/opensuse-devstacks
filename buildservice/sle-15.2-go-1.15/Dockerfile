# Dockerfile generated from generator/../images/go-1.15.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: suse/sles/15.2/go-devel:1.15
#!BuildTag: suse/sles/15.2/go-devel:%%PKG_VERSION%%
#!BuildTag: suse/sles/15.2/go-devel:%%PKG_VERSION%%.%RELEASE%


FROM suse/sle15:15.2

ARG BUILDID=0

# labelprefix=com.suse.go-devel
PREFIXEDLABEL org.opencontainers.image.title="GO 1.15 development container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for GO 1.15 development"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.suse.com/suse/sles/15.2/go-devel:%%PKG_VERSION%%.%RELEASE%"


RUN mv /etc/zypp /etc/zypp.save
ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN --mount=type=secret,id=scc_credentials \
  cp /run/secrets/scc_credentials /etc/zypp/credentials.d/SCCcredentials

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y sles-release


# Development packages
RUN zypper install -y --no-recommends go1.15 git-core



RUN rm -rf /etc/zypp
RUN mv /etc/zypp.save /etc/zypp

