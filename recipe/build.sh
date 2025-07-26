#/bin/bash

export VCPKG_DISABLE_METRICS=""
CXXFLAGS="${CXXFLAGS} -D_LIBCPP_DISABLE_AVAILABILITY"

rm -rf vcpkg
git clone https://github.com/microsoft/vcpkg.git
vcpkg/bootstrap-vcpkg.sh

SKBUILD_CMAKE_ARGS="\
-DCMAKE_CXX_COMPILER=$CXX \
-DCMAKE_C_COMPILER=$CC \
-DCMAKE_TOOLCHAIN_FILE=$SRC_DIR/vcpkg/scripts/buildsystems/vcpkg.cmake \
-DVCPKG_MANIFEST_DIR=$SRC_DIR \
-DVCPKG_MANIFEST_FEATURES=python"

export SKBUILD_CMAKE_ARGS

$PYTHON -m pip install python/ -vv