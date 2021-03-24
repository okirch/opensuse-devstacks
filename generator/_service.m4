define(`_GENERATOR_BASEDIR',regexp(__file__,`\(.*\)/[^/]*$',`\1'))dnl
dnl common.m4 redefines the quote characters to [ ]
include(_GENERATOR_BASEDIR`/common.m4')dnl
<services>
    <service mode="buildtime" name="kiwi_metainfo_helper"/>
    <service name="replace_using_package_version" mode="buildtime">
        <param name="file">Dockerfile</param>
        <param name="regex">%%PKG_VERSION%%</param>
        <param name="parse-version">patch</param>
        <param name="package">_IMAGE_MAIN_PACKAGE</param>
    </service>
    <service mode="buildtime" name="docker_label_helper"/>
</services>
