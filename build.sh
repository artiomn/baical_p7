#!/bin/bash

VERBOSE=0
DEBUG=0
CMAKE_ADD_OPTS=""
MAKE_ADD_OPTS=""

CURDIR="$(dirname "$(readlink -f "$0")")"

usage() { echo "Usage: $0 [-v] [-d]" 1>&2; }


build()
{
  [ $VERBOSE == 1 ] && MAKE_ADD_OPTS="${MAKE_ADD_OPTS} VERBOSE=1"
  [ $DEBUG == 1 ] && CMAKE_ADD_OPTS="${CMAKE_ADD_OPTS} -DCMAKE_BUILD_TYPE=Debug"
  set -e
  set -o xtrace

  # mkdir build 2> /dev/null

  export CCACHE_DISABLE=1

  cmake \
        -DBUILD_TESTS=true \
        -DCMAKE_INSTALL_PREFIX="install" \
        -DCMAKE_EXPORT_COMPILE_COMMANDS=On \
        ${CMAKE_ADD_OPTS} \
        -B build \
        -S . && \
  cmake --build build --parallel --clean-first

}

build
