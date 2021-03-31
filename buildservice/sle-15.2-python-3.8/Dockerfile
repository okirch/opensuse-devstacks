# Dockerfile generated from generator/../images/python-3.8.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: suse/sles/15.2/python-devel:3.8
#!BuildTag: suse/sles/15.2/python-devel:%%PKG_VERSION%%
#!BuildTag: suse/sles/15.2/python-devel:%%PKG_VERSION%%.%RELEASE%


FROM suse/sle15:15.2

ARG BUILDID=0

# labelprefix=com.suse.python-devel
PREFIXEDLABEL org.opencontainers.image.title="Python 3.8 container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for Python 3.8"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.suse.com/suse/sles/15.2/python-devel:%%PKG_VERSION%%.%RELEASE%"

# Add extra repositories
RUN --mount=type=secret,id=scc_credentials zypper addrepo --refresh https://download.opensuse.org/repositories/home:/okir:/devstacks/SLE_15_SP2/home:okir:devstacks.repo
RUN --mount=type=secret,id=scc_credentials zypper refresh


RUN mv /etc/zypp /etc/zypp.save
ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN ln -sf /run/secrets/scc_credentials /etc/zypp/credentials.d/SCCcredentials
RUN --mount=type=secret,id=scc_credentials zypper refresh

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN --mount=type=secret,id=scc_credentials zypper install -y --no-recommends sles-release


# Install packages
RUN --mount=type=secret,id=scc_credentials zypper install -y --no-recommends python38-base python38-pip python38-setuptools python38-wheel


RUN rm -rf /etc/zypp
RUN mv /etc/zypp.save /etc/zypp

