#!/bin/sh
#
# post build script for SWARCO Embedded Linux V3
# 2017-2018, "Guido Classen"
#

BOARD_DIR="$(dirname $0)"
sh ${BOARD_DIR}/../common/post-build.sh

install -m 0755 ${BOARD_DIR}/soft-rtc/S10soft-rtc       ${TARGET_DIR}/etc/init.d
install -m 0755 ${BOARD_DIR}/soft-rtc/soft-rtc-update.sh ${TARGET_DIR}/usr/bin
install -m 0644 ${BOARD_DIR}/soft-rtc/soft-rtc          ${TARGET_DIR}/etc/default

if ! grep /usr/bin/soft-rtc-update.sh ${TARGET_DIR}/etc/crontab >/dev/null 2>&1
then
    echo '0,15,30,45 * * * * /usr/bin/soft-rtc-update.sh' >>${TARGET_DIR}/etc/crontab
fi

