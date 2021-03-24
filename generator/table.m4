define(`_GENERATOR_BASEDIR',regexp(__file__,`\(.*\)/[^/]*$',`\1'))dnl
dnl common.m4 redefines the quote characters to [ ]
include(_GENERATOR_BASEDIR`/common.m4')dnl
dnl
dnl ############################################################
dnl Output starts here
dnl ############################################################
dnl User serviceable part:
define([_DOWNLOAD_REGISTRY_URL],[https://hub.docker.com/repository/docker/okir])
define([_DOWNLOAD_LINK],[<a href="_DOWNLOAD_REGISTRY_URL/$1">$1</a>])
define([_CHECK_ONE_OS],[
 <!-- $1 -->
__CHECK_IMAGE_COMPATIBILITY($1,_COMPAT_OS_LIST)dnl
 <td>ifdef([_COMPAT_MATCH],[_DOWNLOAD_LINK($1-_IMAGE_ID)],[n/a])</td>[]])
define([__OS_PROCESS],[dnl
_CHECK_ONE_OS([$1])dnl
ifelse($#,1,[],[__OS_PROCESS(shift($@))])dnl
])dnl
define([OS_PROCESS],[__OS_PROCESS(_OS_LIST)])dnl
<tr>
 <td>_IMAGE_ID</td>
OS_PROCESS(_OS_LIST)
</tr>
