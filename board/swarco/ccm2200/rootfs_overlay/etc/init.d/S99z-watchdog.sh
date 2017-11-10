#!/bin/sh
#*****************************************************************************
#* 
#*  @file          S99z-watchdog.sh
#*
#*  /etc/init.d script to start watchdog trigger process
#*
#*  @version       1.0 (\$Revision: 189 $)
#*  @author        Guido Classen <br>
#*                 2008-2017 SWARCO Traffic Systems GmbH
#* 
#*  $LastChangedBy: clg9tr $  
#*  $Date: 2009-05-26 16:27:12 +0200 (Di, 26 Mai 2009) $
#*  $URL: svn://server-i/weiss-linux/buildroot/weiss_ch_conf/etc/init.d/S20z_usb_update $
#*
#*  @par Modification History:
#*    2010-03-10 gc: initial version
#*
#*  
#*****************************************************************************

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
    #check DIP switch 5
    if [ $((`ccm2200_gpio_test /dev/ccm2200_gpio sconf` & 1)) != 0 ]; then
        
 	echo "Starting watchdog..."
        /sbin/watchdog -t 1 /dev/ccm2200_watchdog
    else
        # dont start watchdog trigger process if CCM2200 is in service mode
 	echo "Watchdog disabled - CCM2200 in service mode"
        logger -t $0 "Watchdog disabled - CCM2200 in service mode"
        sys_mesg -n "watchdog" -e service-mode -p warning `M_ "CCM2200 in service mode. Watchdog disabled! Please set DIP-switches 4 and 5 to the OFF position." `
        /usr/bin/ccm2200_watchdog /dev/ccm2200_watchdog led 0x0000
        echo 100 >/sys/class/leds/led15/brightness
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
