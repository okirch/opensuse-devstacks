# Dockerfile generated from generator/../images/python-3.8.def
FROM registry.suse.com/suse/sle15:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="Python 3.8 container"
LABEL org.opencontainers.image.description="Environment for Python 3.8"
LABEL org.opencontainers.image.version="3.8-$BUILDID"


RUN mv /etc/zypp /etc/zypp.save
ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN --mount=type=secret,id=scc_credentials \
  cp /run/secrets/scc_credentials /etc/zypp/credentials.d/SCCcredentials


RUN zypper in -y python38-base python38-pip python38-setuptools python38-wheel



RUN rm -rf /etc/zypp
RUN mv /etc/zypp.save /etc/zypp

