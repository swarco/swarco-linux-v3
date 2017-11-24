#
# /etc/init_common.sh
#
# Common code sourced by init scripts (Helper code for module loading)
#
#
# Copyright (C) 2005 by Weiss-Electronic GmbH
#                       SWARCO Traffic Systems GmbH
#                       Guido Classen <clagix@gmail.com>
# All rights reserved.
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License version
# 2 or later as published by the Free Software Foundation.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.   See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, see <http://www.gnu.org/licenses/>.
#
# Modification History:
#    2005-09-05 gc: initial version
#


##############################################################################
# 2005-05-17 gc: Shell functions
##############################################################################
load_module() {
    module=$1
    shift
    if ! lsmod | grep ${module##*/} ; then
      echo loading module: "$module $@"
      $INSMOD $MODULE_PATH/$module$MODULE_SUFF $@
    fi
}

##############################################################################
# 2005-05-17 gc: End shell functions
##############################################################################


kernel_version=`uname -r`
kernel_minor=${kernel_version##*.}

case "$kernel_version" in
        3.*)
                echo detected Kernel Version 3.x
                INSMOD=/sbin/insmod
                MODULE_PATH=/lib/modules/$kernel_version
                MODULE_SUFF=.ko
                kernel_version_group=2.6
        ;;

        2.6.*)
                echo detected Kernel Version 2.6
                #exec /etc/rcS-2.6
#                INSMOD=/usr/bin/insmod.module-init-tools
                INSMOD=/sbin/insmod
#                MODULE_PATH=/mnt/weiss/lib/modules/$kernel_version
                MODULE_PATH=/lib/modules/$kernel_version
                MODULE_SUFF=.ko
                kernel_version_group=2.6
##############################################################################
# 2006-06-09 mf: /dev/pts already mounted
##############################################################################
                # mount /dev/pts explicitly
                # mount -t devpts none /dev/pts

        ;;

        2.4.*)
                echo detected Kernel Version 2.4
                INSMOD=/sbin/insmod
                MODULE_PATH=/lib/modules/$kernel_version
                MODULE_SUFF=.o
                if [ $kernel_minor -lt 20 ]
                then
                    kernel_version_group=2.4-early
                else
                    kernel_version_group=2.4-late
                fi

        ;;
esac
