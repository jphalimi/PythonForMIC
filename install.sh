#!/bin/bash

echo "Configuring Python host... "
./configure
echo "done";

echo "Compiling Python host... "
make
echo "done"

echo "Saving host executables... "
mv python hostpython
mv Parser/pgen Parser/hostpgen
echo "done"

echo "Cleaning build... "
make distclean
echo "done"

echo "Applying Xeon Phi patch... "
patch -p1 < Python-2.6.6-xcompile.patch
echo "done"

echo "Configuring Python for MIC..."
./configure CC="icc -mmic -I/usr/include/"  CXX="icpc -mmic -I/usr/include/" --host=x86_64 --without-gcc
echo "done"

echo "Compiling Python for MIC..."
make HOSTPYTHON=./hostpython HOSTPGEN=./Parser/hostpgen  CROSS_COMPILE=k1om- CROSS_COMPILE_TARGET=yes HOSTARCH=k1om BUILDARCH=x86_64-linux-gnu EXTRA_CFLAGS="-fp-model precise"
echo "done"

echo "Installing Python for MIC in ./_binaries/"
make install HOSTPYTHON=./hostpython  CROSS_COMPILE_TARGET=yes prefix=_binaries/
echo "done"

echo "You can now copy the content of ./_binaries/ to mic0:/bin"
echo "Congrats, your installation is ready to use"

echo "======================================================="
echo "PythonForMIC ready"
echo "------------------"
echo "Please copy the _binaries folder to the mic card with the following command:"
echo "\t scp -r ./_binaries/  mic0:~/"
echo ""
