divert(-1)
changequote([,])dnl
define([BASE_IMAGE], [define([_BASE_IMAGE],$1)]) dnl
define([IMAGE_TITLE], [define([_IMAGE_TITLE],$1)]) dnl
define([IMAGE_DESCRIPTION], [define([_IMAGE_DESCRIPTION],$1)]) dnl
define([IMAGE_VERSION], [define([_IMAGE_VERSION],$1)]) dnl
define([IMAGE_TAG], [define([_IMAGE_TAG],$1)]) dnl
define([BUILD_INSTRUCTIONS], [
	ifelse($#,[1],[
	    dnl Just one argument: define instructions for all base images
	    define([_BUILD_INSTRUCTIONS],$1)
	],
	dnl else: define instructions only if $1 matches the base OS
	_BASE_OS,[$1],
	define([_BUILD_INSTRUCTIONS],$2)
	)
]) dnl
define([_BUILD_INSTRUCTIONS],[# No build instructions defined for this base image.])

define([__CHECK_COMPAT],[
 ifelse([$1],_BASE_OS,[
 	  define([_COMPAT_MATCH],$1)
	],
 	$#,1,[
	end of list
	],[
	check shift($@)
	__CHECK_COMPAT(shift($@))
	])
])
__CHECK_COMPAT(_IMAGE_COMPAT)
define([IMAGE_COMPATIBLE],[
 define([_COMPAT_OS_LIST],[$@])
 ifdef([_BASE_OS],[
   undef([_COMPAT_MATCH])
   __CHECK_COMPAT($@)
   ifdef([_COMPAT_MATCH],,
    [errprint(Error: Base OS _BASE_OS not in list of compatible operating systems
    )
    m4exit(1)]
   )
 ])
])

include(_IMAGE_DEF_PATH)dnl

ifdef([_BASE_OS],[
 define([_IMAGE_INCLUDE],_GENERATOR_BASEDIR[/os-]_BASE_OS[.def])
 include(_IMAGE_INCLUDE)
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
    [$#],1,[$1 ],
    [$1 __PRINT_LIST(shift($@))])dnl
])

divert(0)dnl
