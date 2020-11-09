#!/bin/sh
# $Id$

SWARCO_LEDS="/dev/swarco/leds"

ITC2_LEDS_PATH=/sys/class/leds
ITC2_LEDS="led1 led2 led3 led4 led5"

ITC2_5_LEDS_PATH=/sys/devices/soc0/gpioleds/leds
ITC2_5_LEDS="Status_1 Status_2 Status_3 Status_4 Watchdog_Status"

ITC3_LEDS_PATH=/sys/devices/soc0/gpioleds/leds
ITC3_LEDS=""

AIR_MKII_LEDS_PATH=/sys/class/leds/
AIR_MKII_LEDS="board_led_1 board_led_2 board_led_3 board_led_4 board_led_5 board_led_6"

mkdir -p $SWARCO_LEDS

# ---------- ITC-3 ---------- #
if [ "x$PLATFORM" == "xswarco-itc3-sama5" ]
then
    echo -n " * Configuring LEDs for ITC3 CPU ... "
    for led in $ITC3_LEDS
    do
        if [ -d $ITC3_LEDS_PATH/$led ]
        then
            echo "0" > $ITC3_LEDS_PATH/$led/brightness
            ln -s $ITC3_LEDS_PATH/$led/brightness $SWARCO_LEDS/$led
        fi
    done
    echo " OK "
fi

# --------- ITC-2.5 --------- #
if [ "x$PLATFORM" == "xswarco-itc2.5-sama5" ]
then
    echo -n " * Configuring LEDs for ITC2.5 CPU ... "
    for led in $ITC2_5_LEDS
    do
        if [ -d $ITC2_5_LEDS_PATH/$led ]
        then
            echo "0" > $ITC2_5_LEDS_PATH/$led/brightness
            ln -s $ITC2_5_LEDS_PATH/$led/brightness $SWARCO_LEDS/$led
        fi
    done
    echo " OK "
fi

# ---------- ITC-2 ---------- #
if [ "x$PLATFORM" == "xSwarcoCPU" ]
then
    echo -n " * Configuring LEDs for ITC2 CPU ... "
    for led in $ITC2_LEDS
    do
        if [ -d $ITC2_LEDS_PATH/$led ]
        then
            echo "0" > $ITC2_LEDS_PATH/$led/brightness
            echo "none" > $ITC2_LEDS_PATH/$led/trigger
            ln -s $ITC2_LEDS_PATH/$led/brightness $SWARCO_LEDS/$led
        fi
    done

    if [ -d $ITC2_LEDS_PATH/led5 ]
    then
        echo "heartbeat" > $ITC2_LEDS_PATH/led5/trigger
    elif [ -d $ITC2_LEDS_PATH/led1 ]
    then
        echo "heartbeat" > $ITC2_LEDS_PATH/led1/trigger
    fi
    echo " OK "
fi

# ---------- AIR Mk.II ---------- #
if [ "x$PLATFORM" == "xswarco-scc-air-mk2-sama5" ]
then
    echo -n " * Configuring LEDs for Air Mk.II ... "
    for led in $AIR_MKII_LEDS
    do
        if [ -d $AIR_MKII_LEDS_PATH/$led ]
        then
            echo "0" > $AIR_MKII_LEDS_PATH/$led/brightness
            ln -s $AIR_MKII_LEDS_PATH/$led/brightness $SWARCO_LEDS/$led
        fi
    done
    echo " OK "
fi
