#!/bin/sh
#
# post build script for SWARCO Embedded Linux V3.1
# 2017-2023, "Guido Classen"
#
set -x

BOARD_DIR="$(dirname $0)"
sh ${BOARD_DIR}/../common/post-build.sh

