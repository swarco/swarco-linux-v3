#!/bin/sh
#*****************************************************************************
#* 
#*  @file          S*bootlog
#*
#*  Log reboots in permanent file
#*
#*  @version       1.0 (\$Revision$)
#*  @author        Guido Classen <br>
#*                 2008-2017 SWARCO Traffic Systems GmbH
#* 
#*  $LastChangedBy$  
#*  $Date$
#*  $URL$
#*
#*  @par Modification History:
#*    2010-05-19 gc: initial version
#*  
#*****************************************************************************

LOGFILE=/var/log-archive/systemboot.log


write_log_line() {
    rw
    echo `date "+%Y-%m-%d %H:%M:%S"` "$*" >>$LOGFILE
    #rotate logfile if necessary
    find $LOGFILE -size +100000c -exec mv $LOGFILE ${LOGFILE}.0 \;
    ro
}


case "$1" in
    start)
        write_log_line system boot
        ;;
    stop)
        write_log_line system shutdown
        ;;
    restart|reload)
        ;;
    *)
        echo $"Usage: $0 {start|stop|restart}"
        exit 1
esac

exit $?
