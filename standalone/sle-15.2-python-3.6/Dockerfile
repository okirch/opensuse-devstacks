# Dockerfile generated from generator/../images/python-3.6.def
FROM registry.suse.com/suse/sle15:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="Python 3.6 container"
LABEL org.opencontainers.image.description="Environment for Python 3.6"
LABEL org.opencontainers.image.version="3.6-$BUILDID"


RUN mv /etc/zypp /etc/zypp.save
ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN --mount=type=secret,id=scc_credentials \
  ln -sf /run/secrets/scc_credentials /etc/zypp/credentials.d/SCCcredentials

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y sles-release


RUN zypper in -y python3-base python3-pip python3-setuptools python3-wheel

# pip package is woefully outdated
RUN pip3 install --upgrade pip



RUN rm -rf /etc/zypp
RUN mv /etc/zypp.save /etc/zypp

