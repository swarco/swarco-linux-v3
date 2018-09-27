#!/bin/sh
#
# post build script for SWARCO Embedded Linux V3
# 2017-2018, "Guido Classen"
#

cat >${TARGET_DIR}/etc/issue <<EOF 
Welcome to SWARCO Traffic Systems GmbH Embedded Linux v3  
Version: ${BR2_VERSION_FULL}   Build: `date '+%Y-%m-%d'`
EOF

# 2018-04-26 gc: run if-add-* scripts when new network device is plugged
cat >>${TARGET_DIR}/etc/mdev.conf <<EOF 
eth[0-9]+	root:root 660 @/bin/sh /etc/network/if-add-\$INTERFACE
usb[0-9]+	root:root 660 @/bin/sh /etc/network/if-add-\$INTERFACE
EOF

# Disable unneeded services (can be enabled later using 
# chmod a+x /etc/init.d/Sxxxxx )
#
chmod a-x ${TARGET_DIR}/etc/init.d/S49ntp                       \
          ${TARGET_DIR}/etc/init.d/S50stunnel                   \
          ${TARGET_DIR}/etc/init.d/S59snmpd                     \
          ${TARGET_DIR}/etc/init.d/S60openvpn

                                                               
