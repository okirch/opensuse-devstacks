# Dockerfile generated from generator/../images/rust.def
FROM registry.opensuse.org/opensuse/tumbleweed

ARG BUILDID=0

LABEL org.opencontainers.image.title="Rust development container"
LABEL org.opencontainers.image.description="Environment for Rust development"
LABEL org.opencontainers.image.version="1.50-$BUILDID"


# Work around https://github.com/openSUSE/obs-build/issues/487
RUN zypper install -y openSUSE-release-appliance-docker

# Install packages
RUN zypper install -y --no-recommends rust cargo clippy rls rustfmt rust-gdb

# no cleanup required
