#!/bin/sh
SOFT_RTC_FILES=
SOFT_RTC_UPDATE=
if [ -f /etc/default/soft-rtc ]
then
    . /etc/default/soft-rtc
fi

if [ "$SOFT_RTC_UPDATE" = "true" ]; then
    set $SOFT_RTC_FILES
    touch $1
fi
