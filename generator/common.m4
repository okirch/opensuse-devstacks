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

dnl
dnl Generic list iteration macro
dnl
dnl Assume you have a comma separated list named __THE_LIST__ which you
dnl want to process. For processing, you have defined a macro that handles
dnl a single list item:
dnl  define([MY_ITEM_HANDLER],[... whatever you like $1 ...])
dnl
dnl In order to process a list, do this:
dnl  define([___LIST_ITEM_APPLY],[MY_ITEM_HANDLER])__LIST_ITERATE(__THE_LIST__)
dnl
define([__LIST_ITERATE],[dnl
ifelse(
    [$#],0,[],
    [$#],1,[___LIST_ITEM_APPLY()($1)],
    [___LIST_ITEM_APPLY()($1)__LIST_ITERATE(shift($@))])])

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

define([EXTRA_REPO],[
 ifdef([_EXTRA_REPO_LIST],
  [define([_EXTRA_REPO_LIST],_EXTRA_REPO_LIST,$1)],
  [define([_EXTRA_REPO_LIST],$1)]
  )
])

define([__ADD_ONE_REPO],[_BUILD_ENABLE_REPO($1)])
define([__ADD_REPOS],[dnl
ifelse(
    [$#],0,[],
    [$#],1,[__ADD_ONE_REPO($1)],
    [__ADD_ONE_REPO($1)
__ADD_REPOS(shift($@))])[]dnl
])

define([_ADD_EXTRA_REPOS],[ifdef([_EXTRA_REPO_LIST],[dnl
# Add extra repositories
__ADD_REPOS(_EXTRA_REPO_LIST)
_BUILD_REFRESH_REPOS
])])

define([EXTRA_GPGKEY],[
 ifdef([_EXTRA_GPGKEY_LIST],
  [define([_EXTRA_GPGKEY_LIST],_EXTRA_GPGKEY_LIST,$1)],
  [define([_EXTRA_GPGKEY_LIST],$1)]
  )
])

define([__ADD_ONE_GPGKEY],[RUN --mount=type=secret,id=key_$1 rpm --import /run/secrets/key_$1
])
define([_ADD_EXTRA_GPGKEYS],[ifdef([_EXTRA_GPGKEY_LIST],[dnl
# Add extra gpg keys
define([___LIST_ITEM_APPLY],[__ADD_ONE_GPGKEY])__LIST_ITERATE(_EXTRA_GPGKEY_LIST)
])])

define([EXTRA_OPENSUSE_REPO],[
 EXTRA_REPO(format([https://download.opensuse.org/repositories/%s/%s/%s.repo],
	patsubst($1,[:],[:/]),
	_OBS_DISTRO_ID,
	$1))
 EXTRA_GPGKEY(patsubst($1,[:],[_]))
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
