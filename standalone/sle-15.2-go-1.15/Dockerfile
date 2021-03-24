# Dockerfile generated from generator/../images/go-1.15.def
FROM registry.suse.com/suse/sle15:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="GO 1.15 development container"
LABEL org.opencontainers.image.description="Environment for GO 1.15 development"
LABEL org.opencontainers.image.version="1.15-$BUILDID"


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

