# Dockerfile generated from generator/../images/rust.def
#
# Defines the tag for OBS and build script builds:
#!BuildTag: opensuse/rust-devel:1.50
#!BuildTag: opensuse/rust-devel:%%PKG_VERSION%%
#!BuildTag: opensuse/rust-devel:%%PKG_VERSION%%.%RELEASE%


FROM opensuse/tumbleweed

ARG BUILDID=0

# labelprefix=org.opensuse.rust-devel
PREFIXEDLABEL org.opencontainers.image.title="Rust development container"
PREFIXEDLABEL org.opencontainers.image.description="Development environment for Rust 1.50"
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
PREFIXEDLABEL org.opensuse.reference="registry.opensuse.org/opensuse/rust-devel:%%PKG_VERSION%%.%RELEASE%"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y --no-recommends openSUSE-release-appliance-docker

# Install packages
RUN zypper install -y --no-recommends rust cargo clippy rls rustfmt rust-gdb

# no cleanup required
