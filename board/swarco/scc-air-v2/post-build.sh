#!/bin/sh
#
# post build script for SWARCO Embedded Linux V3
# 2017-2018, "Guido Classen"
#
set -x

BOARD_DIR="$(dirname $0)"
sh ${BOARD_DIR}/../common/post-build.sh

