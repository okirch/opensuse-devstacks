# Dockerfile generated from generator/../images/python-3.8.def
FROM registry.suse.com/suse/sle15:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="Python 3.8 container"
LABEL org.opencontainers.image.description="Development environment for Python 3.8"
LABEL org.opencontainers.image.version="3.8-$BUILDID"


RUN mv /etc/zypp /etc/zypp.save
ADD SCC/sles15-sp2.tar.gz /etc/zypp
RUN ln -sf /run/secrets/scc_credentials /etc/zypp/credentials.d/SCCcredentials
RUN --mount=type=secret,id=scc_credentials zypper refresh

# Work around https://github.com/openSUSE/obs-build/issues/487
RUN --mount=type=secret,id=scc_credentials zypper install -y --no-recommends sles-release


# Add extra gpg keys
RUN --mount=type=secret,id=key_home_okir_devstacks rpm --import /run/secrets/key_home_okir_devstacks

# Add extra repositories
RUN --mount=type=secret,id=scc_credentials zypper addrepo --refresh https://download.opensuse.org/repositories/home:/okir:/devstacks/SLE_15_SP2/home:okir:devstacks.repo
RUN --mount=type=secret,id=scc_credentials zypper refresh

# Install packages
RUN --mount=type=secret,id=scc_credentials zypper install -y --no-recommends python38-base python38-pip python38-setuptools python38-wheel


RUN rm -rf /etc/zypp
RUN mv /etc/zypp.save /etc/zypp

