# Defines the tag for OBS and build script builds:
#!BuildTag: suse/sles/15.2/go-devel:11
#!BuildTag: suse/sles/15.2/go-devel:%%PKG_VERSION%%
#!BuildTag: suse/sles/15.2/go-devel:%%PKG_VERSION%%.%RELEASE%

FROM suse/sle15:15.2

# labelprefix=org.opensuse.go-devel
PREFIXEDLABEL org.opencontainers.image.title="GO 1.15 development container"
PREFIXEDLABEL org.opencontainers.image.description="Environment for GO 1.15 development"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="opensuse/go-devel:%%PKG_VERSION%%.%RELEASE%"

# Work-around
RUN zypper install -y sles-release

# Development packages
RUN zypper install -y --no-recommends go1.15 git-core
