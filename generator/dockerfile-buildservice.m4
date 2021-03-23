define(`_GENERATOR_BASEDIR',regexp(__file__,`\(.*\)/[^/]*$',`\1'))dnl
dnl common.m4 redefines the quote characters to [ ]
include(_GENERATOR_BASEDIR`/common.m4')dnl
dnl
dnl ############################################################
dnl Output starts here
dnl ############################################################
dnl Using an unquoted # would prevent the expansion of IMAGE_DEF
[#] Dockerfile generated from IMAGE_DEF
#
Tag is _IMAGE_TAG
# Defines the tag for OBS and build script builds:
_OBS_BUILD_TAGS

FROM _BASE_IMAGE

ARG BUILDID=0

ifdef([_IMAGE_TAG],dnl
[#] labelprefix=com.suse._IMAGE_TAG
)dnl
ifdef([_IMAGE_TITLE],dnl
PREFIXEDLABEL org.opencontainers.image.title="_IMAGE_TITLE"
)dnl
ifdef([_IMAGE_DESCRIPTION],dnl
PREFIXEDLABEL org.opencontainers.image.description="_IMAGE_DESCRIPTION"
)dnl
PREFIXEDLABEL org.opencontainers.image.created="%BUILDTIME%"
PREFIXEDLABEL org.opencontainers.image.version="%%PKG_VERSION%%.%RELEASE%"
PREFIXEDLABEL org.openbuildservice.disturl="%DISTURL%"
ifdef([_IMAGE_TAG],dnl
PREFIXEDLABEL org.opensuse.reference="_OBS_REGISTRY_HOST/_OBS_REGISTRY_NAMESPACE/_IMAGE_TAG:%%PKG_VERSION%%.%RELEASE%"
)dnl

_BUILD_SETUP

_BUILD_INSTRUCTIONS

_BUILD_CLEANUP
