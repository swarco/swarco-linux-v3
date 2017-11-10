#!/bin/sh
#*****************************************************************************
#* 
#*  @file          /etc/init.d/S13ccm2200_led_init
#*
#*                 initialize CCM2200 front panel LEDs
#*                 2008-2017 SWARCO Traffic-Systems GmbH
#*
#*  @version       0.1
#*  @date          <>
#*  @author        Guido Classen
#* 
#*  @par change history:
#*    2008-03-11 gc: initial version 
#*  
#*****************************************************************************

case "$1" in
  start)
	# break
	;;
  stop)
  	exit 0
	;;
  restart|reload)
  	# break
	;;
  *)
	echo $"Usage: $0 {start|stop|restart}"
	exit 1
esac

echo initializing CCM2200 front panel LEDs
echo nand-disk > /sys/class/leds/led11/trigger 



# Local Variables:
# mode: shell-script
# backup-inhibited: t
# End:
