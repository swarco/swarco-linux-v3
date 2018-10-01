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

get_gadget_iface() {
if [ -d /sys/devices/platform/at91_udc/udc/at91_udc/device/gadget/net ] ; then
    USB_GADGET_IFACE=`cd /sys/devices/platform/at91_udc/udc/at91_udc/device/gadget/net;echo *`
else
    USB_GADGET_IFACE=usb0
fi
}

start() {
 	echo "Starting USB device network interface..."
	insmod /lib/modules/`uname -r`/kernel/drivers/usb/gadget/g_ether.ko \
               host_addr=00:dc:c8:f7:75:05 dev_addr=00:dd:dc:eb:6d:f1
        get_gadget_iface
        ifconfig ${USB_GADGET_IFACE} 10.99.99.99 netmask 255.255.255.248
        # start dhcp server for USB-gadget RNDIS interface!
        sed -e "s/^[ \\t]*interface.*\$/interface ${USB_GADGET_IFACE}/" </etc/udhcp-usb0.conf >/tmp/udhcp-${USB_GADGET_IFACE}.conf
        udhcpd /tmp/udhcp-${USB_GADGET_IFACE}.conf
        iptables -A INPUT -i ${USB_GADGET_IFACE} -j ACCEPT
}

stop() {
	echo -n "Stopping USB device network interface..."
        get_gadget_iface
        ifconfig ${USB_GADGET_IFACE} down
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
