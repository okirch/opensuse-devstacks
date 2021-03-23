#!/bin/bash
#
# Generate Dockerfiles for different build environments
# given a simple image definition
#
# As an hommage to Eric Allman, the processing logic was written in m4.
#
# Copyright (C) 2002, Olaf Kirch <okir@suse.com>
#
# Released under the GPLv2
#
#
# Notes:
#  Generating a single Dockerfile for a given image
#     ./generator.sh --base-os leap-15.2 java-11
#
#  Generating Dockerfile for a given image, and all OS platforms it is compatible with
#     ./generator.sh --base-os all java-11
#
#  Generating Dockerfiles for a all image and OS platforms
#     ./generator.sh --base-os all
#
#  Generating Dockerfiles intended to be used in IBS
#     ./generator.sh --environment buildservice --base-os leap-15.2 java-11
#
#  Generating github workflows:
#     ./generator.sh --target github-workflow --base-os sle-15.2 java-11
#
# Valid base OS names:
#	tumbleweed
#	leap-$major.$minor
#	sle-$major.$servicepack

PROGNAME=$(basename $0)
opt_base_os=tumbleweed
opt_environment=standalone
opt_target=dockerfile
opt_outdir=output

function generate_one {

	image=$1
	os=$2
	m4_script=$3
	outfile=$4

	dir="$opt_outdir/$os-$image"
	mkdir -p $dir

	echo "Generating $outfile for $image on $os"
	outfile="$dir/$outfile"

	m4 -d -DIMAGE_DEF=images/$image.def -D_BASE_OS=$os $m4_script >$outfile
}

eval set -- $(getopt -n $PROGNAME -l base-os:,environment:,target:,output-dir: -o "b:e:t:" -- "$@")
while [ $# -gt 0 ]; do
	arg=$1; shift
	if [ "$arg" = "--" ]; then
		break
	fi

	case $arg in
	--base-os|-b)
		opt_base_os=$1
		shift;;
	--environment|-e)
		opt_environment=$1
		shift;;
	--target|-t)
		opt_target=$1
		shift;;
	--output-dir|-o)
		opt_outdir=$1
		shift;;
	*)
		echo "Unknown option $arg" >&2
		exit 1;;
	esac
done

generator_file=generator/$opt_target-$opt_environment.m4
generator_file_2=generator/$opt_target.m4
if [ -f $generator_file ]; then
	: nop
elif [ -f $generator_file_2 ]; then
	generator_file=$generator_file_2
else
	echo "Neither $generator_file nor $generator_file_2 exist: don't know what to do" >&2
	exit 1
fi

case $opt_target in
dockerfile)
	generated_file=Dockerfile;;
*)
	echo "Don't know how to generate $opt_target" >&2
	exit 1;;
esac

if [ $# -eq 0 ]; then
	set $(ls images | sed 's:\.def$::')
fi

for image_id; do
	if [ $opt_base_os = all ]; then
		for os in $(m4 -d -DIMAGE_DEF=images/$image_id.def generator/compatible.m4); do
			generate_one $image_id $os $generator_file $generated_file
		done
	else
		generate_one $image_id $opt_base_os $generator_file $generated_file
	fi
done
