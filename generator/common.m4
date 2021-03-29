divert(-1)
changequote([,])dnl
define([BASE_IMAGE], [define([_BASE_IMAGE],$1)]) dnl
define([IMAGE_TITLE], [define([_IMAGE_TITLE],$1)]) dnl
define([IMAGE_DESCRIPTION], [define([_IMAGE_DESCRIPTION],$1)]) dnl
define([IMAGE_VERSION], [define([_IMAGE_VERSION],$1)]) dnl
define([IMAGE_TAG], [define([_IMAGE_TAG],$1)]) dnl
define([IMAGE_PACKAGES], [
	define([_IMAGE_PACKAGES],[$@])
	ifdef([_IMAGE_MAIN_PACKAGE],,define([_IMAGE_MAIN_PACKAGE],$1))
])
define([IMAGE_MAIN_PACKAGE], [define([_IMAGE_MAIN_PACKAGE],$1)]) dnl
dnl define([_IMAGE_MAIN_PACKAGE],[errprint([IMAGE_MAIN_PACKAGE] not set)])
define([BUILD_INSTRUCTIONS], [
	dnl This macro will accept one or two arguments
	dnl one argument: define instructions for all base images
	dnl two arguments: define instructions only if $1 matches the base OS
	ifelse($#,[1],[
	    define([_BUILD_INSTRUCTIONS],$1)
	],
	_BASE_OS_ID,$1,[
	define([_BUILD_INSTRUCTIONS],$2)
	])
]) dnl
define([_BUILD_INSTRUCTIONS],[dnl
# Install packages
_BUILD_INSTALL_PACKAGES(_IMAGE_PACKAGES)])

define([__CHECK_COMPAT],[dnl
 ifelse([$1],__CHECK_OS_ID,
 	[define([_COMPAT_MATCH],$1)],
 	[$#],[1],[], dnl end of list
	[__CHECK_COMPAT(shift($@))] dnl check shift($@)
  )dnl
])
define([__CHECK_IMAGE_COMPATIBILITY],[dnl
 define([__CHECK_OS_ID],$1)dnl
 undefine([_COMPAT_MATCH])dnl
 __CHECK_COMPAT(shift($@))dnl
])
define([_CHECK_IMAGE_COMPATIBILITY],[dnl
__CHECK_IMAGE_COMPATIBILITY($1,_COMPAT_OS_LIST)dnl
ifdef([_COMPAT_MATCH],_COMPAT_MATCH,[no match for $1])[]dnl
])
define([IMAGE_COMPATIBLE],[
 define([_COMPAT_OS_LIST],[$@])
 ifdef([_BASE_OS_ID],[
   __CHECK_IMAGE_COMPATIBILITY(_BASE_OS_ID, $@)
   ifdef([_COMPAT_MATCH],,
    [errprint(Error: Base OS _BASE_OS_ID not in list of compatible operating systems
)
    m4exit(1)]
   )
 ])
])

ifdef([_BASE_OS_ID],[
 define([_OS_DEF_PATH],_GENERATOR_BASEDIR[/os-]_BASE_OS_ID[.def])
 include(_OS_DEF_PATH)

 ifelse(substr(_BASE_OS_ID, 0, 3),[sle],[
   define([_BASE_OS_SLE],[1])
 ])
 ifelse(substr(_BASE_OS_ID, 0, 4),[leap],[
   define([_BASE_OS_LEAP],[1])
 ])
 dnl tumbleweed is not versioned
 ifelse(_BASE_OS_ID,[tumbleweed],[
   define([_BASE_OS_TUMBLEWEED],[1])
 ])
])

ifdef([_IMAGE_ID],[
 define([_IMAGE_DEF_PATH],_GENERATOR_BASEDIR[/../images/]_IMAGE_ID[.def])
 include(_IMAGE_DEF_PATH)dnl
])


define([_OBS_BUILD_TAGS],[dnl
ifdef([_IMAGE_TAG],dnl
[#]!BuildTag: _OBS_REGISTRY_NAMESPACE/_IMAGE_TAG:_IMAGE_VERSION
[#]!BuildTag: _OBS_REGISTRY_NAMESPACE/_IMAGE_TAG:%%PKG_VERSION%%
[#]!BuildTag: _OBS_REGISTRY_NAMESPACE/_IMAGE_TAG:%%PKG_VERSION%%.%RELEASE%
)])

define([__PRINT_LIST],[dnl
ifelse(dnl
    [$#],0,[],
    [$#],1,[$1],
    [$1 __PRINT_LIST(shift($@))])[]dnl
])

divert(0)dnl
