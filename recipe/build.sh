#!/bin/bash
set -ex

git clone https://github.com/microsoft/vcpkg.git
vcpkg/bootstrap-vcpkg.sh

export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

if [[ "$target_platform" == linux-ppc64le ]]; then
  export CMAKE_ARGS="-DCMAKE_POLICY_VERSION_MINIMUM=3.5 ${CMAKE_ARGS}"
  $PYTHON scripts/patch-pyproject.py $SRC_DIR/python/pyproject.toml
fi

$PYTHON -m build -w -n -x python/

$PYTHON -m pip install dist/sqsgenerator*.whl