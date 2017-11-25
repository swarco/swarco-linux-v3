#!/bin/sh
#
# post build script for SWARCO Embedded Linux V3
# 2017, "Guido Classen" <clagix@gmail.com>
#

cat >${TARGET_DIR}/etc/issue <<EOF 
Welcome to SWARCO Traffic Systems GmbH Embedded Linux v3  
Version: ${BR2_VERSION_FULL}   Build: `date '+%Y-%m-%d'`
EOF


# Disable unneeded services (can be enabled later using chmod a+x
# /etc/init.d/Sxxxxx
#
chmod a-x ${TARGET_DIR}/etc/init.d/S49ntp                       \
          ${TARGET_DIR}/etc/init.d/S50stunnel                   \
          ${TARGET_DIR}/etc/init.d/S59snmpd                     \
          ${TARGET_DIR}/etc/init.d/S60openvpn

                                                               
