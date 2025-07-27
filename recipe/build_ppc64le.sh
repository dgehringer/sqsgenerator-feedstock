#!/bin/bash
set -ex

git clone https://github.com/microsoft/vcpkg.git
vcpkg/bootstrap-vcpkg.sh

export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"
export CMAKE_ARGS="-DCMAKE_POLICY_VERSION_MINIMUM=3.5 ${CMAKE_ARGS}"
$PYTHON scripts/patch-pyproject.py $SRC_DIR/python/pyproject.toml
$PYTHON -m pip install python/ -v --no-deps --no-build-isolation