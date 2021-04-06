# Dockerfile generated from generator/../images/python-3.8.def
FROM registry.opensuse.org/opensuse/leap:15.2

ARG BUILDID=0

LABEL org.opencontainers.image.title="Python 3.8 container"
LABEL org.opencontainers.image.description="Development environment for Python 3.8"
LABEL org.opencontainers.image.version="3.8-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y --no-recommends openSUSE-release-appliance-docker

# Add extra gpg keys
RUN --mount=type=secret,id=key_home_okir_devstacks rpm --import /run/secrets/key_home_okir_devstacks

# Add extra repositories
RUN zypper addrepo --refresh https://download.opensuse.org/repositories/home:/okir:/devstacks/openSUSE_Leap_15.2/home:okir:devstacks.repo
RUN zypper refresh

# Install packages
RUN zypper install -y --no-recommends python38-base python38-pip python38-setuptools python38-wheel

# no cleanup required
