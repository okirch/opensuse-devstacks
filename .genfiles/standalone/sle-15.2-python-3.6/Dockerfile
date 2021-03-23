# Dockerfile generated from generator/../images/python-3.6.def
FROM registry.suse.com/suse/sle15:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="Python 3.6 container"
LABEL org.opencontainers.image.description="Environment for Python 3.6"
LABEL org.opencontainers.image.version="3.6-$BUILDID"


RUN mv /etc/zypp /etc/zypp.save
ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN --mount=type=secret,id=scc_credentials \
  cp /run/secrets/scc_credentials /etc/zypp/credentials.d/SCCcredentials


# For some inexplicable reasons, this will also pull in python38-base right now...
RUN zypper in -y python36-base python36-pip python36-setuptools python36-wheel



RUN rm -rf /etc/zypp
RUN mv /etc/zypp.save /etc/zypp

