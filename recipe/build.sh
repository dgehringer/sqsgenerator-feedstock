#!/bin/bash
set -ex

git clone https://github.com/microsoft/vcpkg.git
vcpkg/bootstrap-vcpkg.sh

export CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

if [[ "${TARGET_PLATFORM}" == "linux-ppc64le" ]]; then
    export VCPKG_TARGET_TRIPLET="ppc64le-linux"
elif [[ "${TARGET_PLATFORM}" == "osx-arm64" ]]; then
    export VCPKG_TARGET_TRIPLET="arm64-osx"
elif [[ "${TARGET_PLATFORM}" == "osx-64" ]]; then
   export VCPKG_TARGET_TRIPLET="x64-osx"
fi

echo "Platform ${TARGET_PLATFORM} -> ${VCPKG_TARGET_TRIPLET}"

$PYTHON -m build -w -n -x python/

$PYTHON -m pip install python/dist/sqsgenerator*.whl