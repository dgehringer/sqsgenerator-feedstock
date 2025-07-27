#!/bin/bash
set -ex

git clone https://github.com/microsoft/vcpkg.git
vcpkg/bootstrap-vcpkg.sh

export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
export VCPKG_FORCE_SYSTEM_BINARIES=1
$PYTHON -m build -w -n -x python/

$PYTHON -m pip install python/dist/sqsgenerator*.whl