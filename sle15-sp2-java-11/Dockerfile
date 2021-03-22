FROM registry.suse.com/suse/sle15:15.2

ARG JAVA_VERSION
ARG BUILDID

LABEL org.opencontainers.image.title="Java $JAVA_VERSION development container"
LABEL org.opencontainers.image.description="Environment for Java $JAVA_VERSION development"
LABEL org.opencontainers.image.version="$JAVA_VERSION-$BUILDID"

RUN mv /etc/zypp /etc/zypp.save
ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN --mount=type=secret,id=scc_credentials \
  cp /run/secrets/scc_credentials /etc/zypp/credentials.d/SCCcredentials

# Work-around
RUN zypper install -y sles-release

# Development packages
RUN zypper install -y --no-recommends osc java-$JAVA_VERSION-openjdk-devel maven git-core

RUN rm -rf /etc/zypp
RUN mv /etc/zypp.save /etc/zypp
