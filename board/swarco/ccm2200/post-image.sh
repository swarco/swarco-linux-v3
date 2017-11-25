#!/bin/sh
#
# post-image.sh script for SWARCO Embedded Linux V3
#

# Rename output files with name needed for USB stick update
if [ -f $BINARIES_DIR/rootfs.ubifs ] ; then
    mv -f $BINARIES_DIR/rootfs.ubifs  $BINARIES_DIR/rootfs-ccm2200-lp.arm.ubifs
fi
if [ -f $BINARIES_DIR/uImage ] ; then
    mv -f $BINARIES_DIR/uImage        $BINARIES_DIR/uImage-ccm2200-ubifs.bin
fi
