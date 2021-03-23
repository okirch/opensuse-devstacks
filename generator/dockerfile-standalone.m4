define(`_GENERATOR_BASEDIR',regexp(__file__,`\(.*\)/[^/]*$',`\1'))dnl
dnl common.m4 redefines the quote characters to [ ]
include(_GENERATOR_BASEDIR`/common.m4')dnl
dnl
dnl ############################################################
dnl Output starts here
dnl ############################################################
dnl Using an unquoted # would prevent the expansion of IMAGE_DEF
[#] Dockerfile generated from IMAGE_DEF
FROM _BASE_IMAGE

ARG BUILDID=0

ifdef([_IMAGE_TITLE],dnl
LABEL org.opencontainers.image.title="_IMAGE_TITLE"
)dnl
ifdef([_IMAGE_DESCRIPTION],dnl
LABEL org.opencontainers.image.description="_IMAGE_DESCRIPTION"
)dnl
ifdef([_IMAGE_VERSION],dnl
LABEL org.opencontainers.image.version="_IMAGE_VERSION-$BUILDID"
)dnl

_BUILD_SETUP

_BUILD_INSTRUCTIONS

_BUILD_CLEANUP
