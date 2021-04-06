define(`_GENERATOR_BASEDIR',regexp(__file__,`\(.*\)/[^/]*$',`\1'))dnl
dnl common.m4 redefines the quote characters to [ ]
include(_GENERATOR_BASEDIR`/common.m4')dnl
define([__MARKDOWN_ITEM],[- $1
])dnl
define([_MARKDOWN_LIST],[dnl
define([___LIST_ITEM_APPLY],[__MARKDOWN_ITEM])__LIST_ITERATE($@)
])
[#] _IMAGE_TITLE for _OS_SHORT_NAME

This container image provides a _IMAGE_DESCRIPTION.
It is based on _OS_SHORT_NAME and contains the following packages:

_MARKDOWN_LIST(_IMAGE_PACKAGES)

The source project for this container lives at
https://github.com/okirch/opensuse-devstacks

