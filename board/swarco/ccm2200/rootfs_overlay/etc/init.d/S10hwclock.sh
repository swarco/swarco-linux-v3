#!/bin/sh
#
# S10hwclock.sh
#
# Sets system clock to hardware clock
#
# Copyright (C) 2006-2017 by Weiss-Electronic GmbH
#                            SWARCO Traffic Systems GmbH
#                            Guido Classen <clagix@gmail.com>
# All rights reserved.
#     
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version
# 2 or later as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.	 See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <http://www.gnu.org/licenses/>.
#
# Modification History:
#    2006-07-06 gc: initial version
#

set -e
exec="/sbin/hwclock"

test -x "${exec}" || exit 0

case "${1}" in
    start)
	echo -n "Setting system time... "
        for device in /dev/rtc /dev/rtc0 /dev/misc/rtc
        do
            if test -c "$device"; then
	        if ${exec} -s; then
                    echo "done"
                else
                    echo "ERROR"
                fi
                exit 0
            fi
        done
        echo "RTC device missing!"
        exit 1
        
	;;
    *)
	echo "Usage: $0 start"
	exit 1
	;;
esac

# Local Variables:
# mode: shell-script
# backup-inhibited: t
# End:
