#!/bin/sh
#
# post-image.sh script for SWARCO Embedded Linux V3
#

# Rename output files with name needed for USB stick update
if [ -f $BINARIES_DIR/rootfs.ubifs ] ; then
    mv -f $BINARIES_DIR/rootfs.ubifs  $BINARIES_DIR/rootfs-scc-5port.arm.ubifs
fi
if [ -f $BINARIES_DIR/zImage ] ; then
    cat  $BINARIES_DIR/zImage \
         $BINARIES_DIR/sama5d35-swarco-ethernetrouter.dtb  \
         >$BINARIES_DIR/zImage-scc-5port-ubifs.bin
    rm $BINARIES_DIR/zImage
fi
