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

PROGNAME=$(basename $0)
opt_base_os=tumbleweed
opt_environment=standalone
opt_target=dockerfile

eval set -- $(getopt -n $PROGNAME -l base-os:,environment:,target: -o "b:e:t:" -- "$@")
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
	*)
		echo "Unknown option $arg" >&2
		exit 1;;
	esac
done

if [ $# -ne 1 ]; then
	echo "$PROGNAME: expect exactly one image name as argument"
	exit 1
fi
IMAGE=$1

generator_file=generator/$opt_target-$opt_environment.m4

m4 -d -DIMAGE_DEF=images/$IMAGE.def -D_BASE_OS=$opt_base_os $generator_file
