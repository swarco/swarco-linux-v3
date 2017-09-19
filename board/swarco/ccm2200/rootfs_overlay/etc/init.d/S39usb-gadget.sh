#!/bin/sh
#
# S39usb-gadget.sh
#
# Start the USB device network interface
#
# Copyright (C) 2007-2017 by Weiss-Electronic GmbH
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
#   2007 gc: initial version
#


start() {
 	echo "Starting USB device network interface..."
	insmod /lib/modules/`uname -r`/kernel/drivers/usb/gadget/g_ether.ko \
                host_addr=00:dc:c8:f7:75:05 dev_addr=00:dd:dc:eb:6d:f1
        ifconfig usb0 10.99.99.99 netmask 255.255.255.248
        # start dhcp server for USB-gadget RNDIS interface!
        udhcpd /etc/udhcp-usb0.conf
}	
stop() {
	echo -n "Stopping USB device network interface..."
        ifconfig usb0 down
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
	echo $"Usage: $0 {start|stop|restart}"
	exit 1
esac

exit $?

# Local Variables:
# mode: shell-script
# backup-inhibited: t
# End:
