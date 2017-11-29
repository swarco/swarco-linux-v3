#!/bin/sh
#
# S99z-watchdog.sh
#
# Enable hardware watchdog and start trigger process
#
# Copyright (C) 2010-2017 by Weiss-Electronic GmbH
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
#    2010-03-10 gc: initial version
#

WATCHDOG_LED=15
# internationalization functions for messages (identity)
M_() {
  echo "$@"
}

if [ -x /usr/swarco/bin/sys-mesg ]; then
    SYS_MESG=/usr/swarco/bin/sys-mesg
else
    SYS_MESG=/usr/weiss/bin/sys-mesg
fi
sys_mesg() {
    test -x $SYS_MESG && $SYS_MESG "$@"
}


start() {
    if grep -q "Hardware.*:.*CCM2200" /proc/cpuinfo ; then
        # CCM2200 hardware

        #check DIP switch 5
        if [ $((`ccm2200_gpio_test /dev/ccm2200_gpio sconf` & 1)) -ne 0 ]; then
            
 	    echo "Starting watchdog..."
            ccm2200_watchdog /dev/ccm2200_watchdog led $((1<<$WATCHDOG_LED))
            /sbin/watchdog -t 1 /dev/ccm2200_watchdog
        else
            # dont start watchdog trigger process if CCM2200 is in service mode
 	    echo "Watchdog disabled - CCM2200 in service mode"
            logger -t $0 "Watchdog disabled - CCM2200 in service mode"
            sys_mesg -n "watchdog" -e service-mode -p warning `M_ "CCM2200 in service mode. Watchdog disabled! Please set DIP-switches 4 and 5 to the OFF position." `
            /usr/bin/ccm2200_watchdog /dev/ccm2200_watchdog led 0x0000
            echo 100 >/sys/class/leds/led$WATCHDOG_LED/brightness
        fi
    else
        # other hardware, configure watchdog when available
        if [ -c /dev/watchdog ] ; then
            /sbin/watchdog -T 60 -t 1 /dev/watchdog
        fi
    fi
}	


stop() {
       true
}

restart() {
	stop
	start
}	

case "$1" in
  start)
  	start
	;;
  stop)
  	stop
	;;
  restart|reload)
  	restart
	;;
  *)
	echo "Usage: $0 {start|stop|restart}"
	exit 1
esac

exit $?

# Local Variables:
# mode: shell-script
# backup-inhibited: t
# End:
