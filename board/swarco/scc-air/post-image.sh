#!/bin/sh
#
# post-image.sh script for SWARCO Embedded Linux V3
#

# Rename output files with name needed for USB stick update
if [ -f $BINARIES_DIR/rootfs.ubifs ] ; then
    mv -f $BINARIES_DIR/rootfs.ubifs  $BINARIES_DIR/rootfs-sccair.arm.ubifs
fi
if [ -f $BINARIES_DIR/zImage ] ; then
    mv -f $BINARIES_DIR/zImage        $BINARIES_DIR/zImage-sccair-ubifs.bin
fi
