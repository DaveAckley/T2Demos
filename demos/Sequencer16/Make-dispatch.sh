#!/bin/bash
MAKEARG="$1"
ARCH=`uname -m`
NODE=`uname -n`
if [ "x$ARCH" == "xarmv7l" -a "x$NODE" == "xbeaglebone" ] ; then
    ENGINE=t2
    DEFAULT_ULAM_BIN=/home/t2/ULAM/bin
    DEFAULT_MFM_BIN=/home/t2/MFM/bin
else
    ENGINE=mfms
    DEFAULT_ULAM_BIN=/data/ackley/PART4/code/D/ULAM/bin
    DEFAULT_MFM_BIN=/data/ackley/PART4/code/D/MFM/bin
fi
echo BUILDING FOR ENGINE: $ENGINE

MAKEVARS+=" ENGINE=$ENGINE"
MAKEVARS+=" DEFAULT_ULAM_BIN=$DEFAULT_ULAM_BIN"
MAKEVARS+=" DEFAULT_MFM_BIN=$DEFAULT_MFM_BIN"

# Peel off some special cases
TARGENG="$ENGINE-$MAKEARG"

# cdmd is invalid on mfms
if [ "x$TARGENG" == "xmfms-cdmd" ] ; then
    echo "Can't '$MAKEARG' on '$ENGINE'"
    exit 1
fi

# cdmd and install on t2 runs at ., not ./code    
if [ "x$TARGENG" == "xt2-cdmd" -o  "x$TARGENG" == "xt2-install" ] ; then
    make -C . -k -f Makefile-$ENGINE.mk $MAKEARG $MAKEVARS
    exit $?
fi

# everything else runs via ./code/Makefile
echo make -C code -k $MAKEARG $MAKEVARS
make -C code -k $MAKEARG $MAKEVARS

