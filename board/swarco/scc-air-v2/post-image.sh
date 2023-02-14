#!/bin/sh
#
# post-image.sh script for SWARCO Embedded Linux V3.1
#
set -x

# Rename output files with name needed for USB stick update
if [ -f $BINARIES_DIR/rootfs.ubifs ] ; then
    mv -f $BINARIES_DIR/rootfs.ubifs  $BINARIES_DIR/rootfs-scc-air-mk2.arm.ubifs
fi
if [ -f $BINARIES_DIR/zImage ] ; then
    cat  $BINARIES_DIR/zImage \
         $BINARIES_DIR/sama5d35-swarco-scc-air-mk2.dtb  \
         >$BINARIES_DIR/zImage-scc-air-mk2-ubifs.bin
    rm $BINARIES_DIR/zImage
fi
