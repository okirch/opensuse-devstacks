# Dockerfile generated from generator/../images/java-11.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: suse/sles/15.2/openjdk:11
#!BuildTag: suse/sles/15.2/openjdk:%%PKG_VERSION%%
#!BuildTag: suse/sles/15.2/openjdk:%%PKG_VERSION%%.%RELEASE%


FROM suse/sle15:15.2

ARG BUILDID=0

# labelprefix=com.suse.openjdk
PREFIXEDLABEL org.opencontainers.image.title="Java 11 development container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for Java 11 development"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.suse.com/suse/sles/15.2/openjdk:%%PKG_VERSION%%.%RELEASE%"


RUN mv /etc/zypp /etc/zypp.save
ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN ln -sf /run/secrets/scc_credentials /etc/zypp/credentials.d/SCCcredentials
RUN --mount=type=secret,id=scc_credentials zypper refresh

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN --mount=type=secret,id=scc_credentials \
  zypper install -y --no-recommends sles-release


# Install packages
RUN --mount=type=secret,id=scc_credentials \
  zypper install -y --no-recommends java-11-openjdk-devel osc maven git-core


RUN rm -rf /etc/zypp
RUN mv /etc/zypp.save /etc/zypp

