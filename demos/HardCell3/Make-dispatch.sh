#!/bin/bash
MAKEARG="$1"
ARCH=`uname -m`
NODE=`uname -n`
if [ "x$ARCH" == "xarmv7l" -a "x$NODE" == "xbeaglebone" ] ; then
    ENGINE=t2
    CDMD=ok
else
    ENGINE=mfms
fi
echo BUILDING FOR ENGINE: $ENGINE
if [ "x$MAKEARG" == "xcdmd" ] ; then
    if [ "x$ENGINE" == "xmfms" ] ; then
        echo "Can't '$MAKEARG' on '$ENGINE'"
        exit 1
    else
        make -k -f Makefile-t2.mk cdmd
    fi
else
    make -C code -k -f Makefile-$ENGINE.mk $MAKEARG
fi
