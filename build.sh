#!/bin/bash
usage() {
	echo "Usage: build.sh <build_path> [architecture]"
	echo "		build_path:	a path where to build the project."
	echo "		architecture:	default is x86."
}

srcpath=`dirname $0 | pwd`

if [ $# -gt 2 ]; then
	usage
	exit -1;
fi

if [ ! -e $1 ]; then
	mkdir -p $1
fi
cd $1

buildpath=`pwd`
installpath=$buildpath/binary

mkdir $1/buildtmp
cd $1/buildtmp


cmake -DCMAKE_INSTALL_PREFIX=$installpath $srcpath/source/libsrc

make
make install


cd ..
rm -rf buildtmp
