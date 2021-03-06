define(`_GENERATOR_BASEDIR',regexp(__file__,`\(.*\)/[^/]*$',`\1'))dnl
dnl common.m4 redefines the quote characters to [ ]
include(_GENERATOR_BASEDIR`/common.m4')dnl
dnl
dnl ############################################################
dnl Output starts here
dnl ############################################################
dnl Using an unquoted # would prevent the expansion of _IMAGE_DEF_PATH
[#] Dockerfile generated from _IMAGE_DEF_PATH
#
# Defines the tag for OBS and build script builds:
_OBS_BUILD_TAGS

FROM _BASE_IMAGE

ARG BUILDID=0

ifdef([_IMAGE_TAG],dnl
[#] labelprefix=_OCI_NAMESPACE_PREFIX._IMAGE_TAG
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
dnl should this always be org.opensuse.reference or should we use
dnl _OCI_NAMESPACE_PREFIX.reference instead?
PREFIXEDLABEL org.opensuse.reference="_OBS_REGISTRY_HOST/_OBS_REGISTRY_NAMESPACE/_IMAGE_TAG:%%PKG_VERSION%%.%RELEASE%"
)dnl

_ADD_EXTRA_REPOS[]dnl
_BUILD_SETUP[]dnl
_BUILD_INSTRUCTIONS
_BUILD_CLEANUP[]dnl
