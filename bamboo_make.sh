#!/bin/bash -xe
# Always run this in repo root directory.
# $PREFIX can override where this builds.
type module >& /dev/null || source /mnt/software/Modules/current/init/bash

module load gcc
module load git
module load ccache

export CPPFLAGS=-D_GNU_SOURCE
DEFAULT_PREFIX=$PWD/build
PREFIX=${PREFIX:-${DEFAULT_PREFIX}}
rm -rf ${PREFIX}
mkdir -p ${PREFIX}/bin
make clean
make -j 
make PREFIX=${PREFIX} install
