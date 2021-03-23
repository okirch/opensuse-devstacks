dnl
dnl All this script does is print a white space separated list
dnl of operating systems a given image definition is compatible with.
dnl
define(`_GENERATOR_BASEDIR',regexp(__file__,`\(.*\)/[^/]*$',`\1'))dnl
dnl common.m4 redefines the quote characters to [ ]
include(_GENERATOR_BASEDIR`/common.m4')dnl
__PRINT_LIST(_COMPAT_OS_LIST)
