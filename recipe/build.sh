#!/bin/bash

cd lib/comgr

mkdir build
cd build

cmake \
  -DLLVM_DIR=$PREFIX \
  -DCMAKE_INSTALL_PREFIX=$PREFIX \
  -DCMAKE_BUILD_TYPE=Release \
  -DCMAKE_INSTALL_LIBDIR=lib \
  ..

make VERBOSE=1 -j${CPU_COUNT}
ctest --output-on-failure
make install

# ln -sf $PREFIX/lib/libamd_comgr.so $PREFIX/lib/libamdcomgr64.so
