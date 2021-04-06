# Dockerfile generated from generator/../images/python-3.6.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: suse/sles/15.2/python-devel:3.6
#!BuildTag: suse/sles/15.2/python-devel:%%PKG_VERSION%%
#!BuildTag: suse/sles/15.2/python-devel:%%PKG_VERSION%%.%RELEASE%


FROM suse/sle15:15.2

ARG BUILDID=0

# labelprefix=com.suse.python-devel
PREFIXEDLABEL org.opencontainers.image.title="Python 3.6 container"
PREFIXEDLABEL org.opencontainers.image.description="Development environment for Python 3.6"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.suse.com/suse/sles/15.2/python-devel:%%PKG_VERSION%%.%RELEASE%"


RUN mv /etc/zypp /etc/zypp.save
ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN ln -sf /run/secrets/scc_credentials /etc/zypp/credentials.d/SCCcredentials
RUN --mount=type=secret,id=scc_credentials zypper refresh

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN --mount=type=secret,id=scc_credentials zypper install -y --no-recommends sles-release


RUN zypper in -y python3-base python3-pip python3-setuptools python3-wheel

# pip package is woefully outdated
RUN pip3 install --upgrade pip


RUN rm -rf /etc/zypp
RUN mv /etc/zypp.save /etc/zypp

