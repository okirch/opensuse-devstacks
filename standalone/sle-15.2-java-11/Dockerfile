# Dockerfile generated from generator/../images/java-11.def
FROM registry.suse.com/suse/sle15:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="Java 11 development container"
LABEL org.opencontainers.image.description="Environment for Java 11 development"
LABEL org.opencontainers.image.version="11-$BUILDID"


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

