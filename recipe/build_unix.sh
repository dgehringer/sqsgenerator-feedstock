#!/bin/bash
set -ex

git clone https://github.com/microsoft/vcpkg.git
vcpkg/bootstrap-vcpkg.sh

export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
$PYTHON -m pip install python/ -v --no-deps --no-build-isolation