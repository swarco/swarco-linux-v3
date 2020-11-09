#!/bin/sh
#
# This makes symlinks of all hardware interfaces

DEV_SWARCO="/dev/swarco"
DEV_ADC_SWARCO="$DEV_SWARCO/adc"

# make the symlink dir
mkdir -p $DEV_SWARCO
mkdir -p $DEV_ADC_SWARCO

# ---------------------------------------------------------------------------------------------------------------------
# ITC3 (SAMA5)
#     /dev/swarco/console     -> /dev/ttyS0
#     /dev/swarco/detector    -> /dev/ttyS1
#     /dev/swarco/io          -> /dev/ttyS2
#     /dev/swarco/modem       -> /dev/ttyS3
#     /dev/swarco/rs232_1     -> /dev/ttyS4
#     /dev/swarco/rs232_2     -> /dev/ttyS5
# ---------------------------------------------------------------------------------------------------------------------

if [ "x$PLATFORM" == "xswarco-itc3-sama5" ]
then
    echo " * Naming the hardware interfaces for ITC3"

    echo "   > /dev/ttyS0 linked to $DEV_SWARCO/console"
    ln -s /dev/ttyS0 $DEV_SWARCO/console

    echo "   > /dev/ttyS1 linked to $DEV_SWARCO/detector"
    ln -s /dev/ttyS1 $DEV_SWARCO/detector

    echo "   > /dev/ttyS2 linked to $DEV_SWARCO/io"
    ln -s /dev/ttyS2 $DEV_SWARCO/io

    echo "   > /dev/ttyS3 linked to $DEV_SWARCO/modem"
    ln -s /dev/ttyS3 $DEV_SWARCO/modem

    echo "   > /dev/ttyS4 linked to $DEV_SWARCO/rs232_1"
    ln -s /dev/ttyS4 $DEV_SWARCO/rs232_1

    echo "   > /dev/ttyS5 linked to $DEV_SWARCO/rs232_2"
    ln -s /dev/ttyS5 $DEV_SWARCO/rs232_2
fi

# ---------------------------------------------------------------------------------------------------------------------
# ITC2
#     (not linked)console     -> /dev/ttyAT0
#     /dev/swarco/group_1     -> /dev/ttyAT3
#     /dev/swarco/group_2     -> /dev/ttyAT4
#     /dev/swarco/io          -> /dev/ttyS3
#     /dev/swarco/detector    -> /dev/ttyAT2
#     /dev/swarco/modem       -> /dev/ttyS0
#     /dev/swarco/rs232_1     -> /dev/ttyAT1
#     /dev/swarco/rs232_2     -> /dev/ttyS1
#     /dev/swarco/display     -> /dev/ttyS2
# ---------------------------------------------------------------------------------------------------------------------

if [ "x$PLATFORM" == "xSwarcoCPU" ]
then
    echo " * Naming the hardware interfaces for ITC2"

    echo " * /dev/ttyAT3 linked to $DEV_SWARCO/group_1"
    ln -s /dev/ttyAT3 $DEV_SWARCO/group_1

    echo "   > /dev/ttyAT4 linked to $DEV_SWARCO/group_2"
    ln -s /dev/ttyAT4 $DEV_SWARCO/group_2

    echo "   > /dev/ttyS3 linked to $DEV_SWARCO/io"
    ln -s /dev/ttyS3 $DEV_SWARCO/io

    echo "   > /dev/ttyAT2 linked to $DEV_SWARCO/detector"
    ln -s /dev/ttyAT2 $DEV_SWARCO/detector

    echo "   > /dev/ttyS0 linked to $DEV_SWARCO/modem"
    ln -s /dev/ttyS0 $DEV_SWARCO/modem

    echo " * /dev/ttyAT1 linked to $DEV_SWARCO/rs232_1"
    ln -s /dev/ttyAT1 $DEV_SWARCO/rs232_1

    echo " * /dev/ttyS1 linked to $DEV_SWARCO/rs232_2"
    ln -s /dev/ttyS1 $DEV_SWARCO/rs232_2

    echo "   > /dev/ttyS2 linked to $DEV_SWARCO/display"
    ln -s /dev/ttyS2 $DEV_SWARCO/display
fi

# ---------------------------------------------------------------------------------------------------------------------
# ITC2.5
#     /dev/swarco/console     -> /dev/ttyS0
#     /dev/swarco/detector    -> /dev/ttyS1
#     /dev/swarco/group_1     -> /dev/ttyS4
#     /dev/swarco/group_2     -> /dev/ttyS2
#     /dev/swarco/io          -> /dev/ttyS3
#     /dev/swarco/rs232_1     -> USB (controlled by sdev/kernel init)
#     /dev/swarco/rs232_2     -> USB (controlled by sdev/kernel init)
#     /dev/swarco/display     -> USB (controlled by sdev/kernel init)
#     /dev/swarco/modem       -> USB (controlled by sdev/kernel init)
# ---------------------------------------------------------------------------------------------------------------------

if [ "x$PLATFORM" == "xswarco-itc2.5-sama5" ]
then
    echo " * Naming the hardware interfaces for ITC2.5"

    echo " * /dev/ttyS0 linked to $DEV_SWARCO/console"
    ln -s /dev/ttyS0 $DEV_SWARCO/console

    echo " * /dev/ttyS4 linked to $DEV_SWARCO/group_1"
    ln -s /dev/ttyS4 $DEV_SWARCO/group_1

    echo " * /dev/ttyS2 linked to $DEV_SWARCO/group_2"
    ln -s /dev/ttyS2 $DEV_SWARCO/group_2

    echo " * /dev/ttyS3 linked to $DEV_SWARCO/io"
    ln -s /dev/ttyS3 $DEV_SWARCO/io

    echo " * /dev/ttyS1 linked to $DEV_SWARCO/detector"
    ln -s /dev/ttyS1 $DEV_SWARCO/detector
    echo " OK "
fi

# ---------------------------------------------------------------------------------------------------------------------
# TODO: review
# SCC-Air
#     /dev/swarco/console     -> /dev/ttyAT0
#     N/A                     -> /dev/ttyAT1
#     /dev/swarco/rs232       -> /dev/ttyAT2
#     /dev/swarco/bluetooth   -> /dev/ttyAT3
#     /dev/swarco/rs485       -> /dev/ttyAT4
#     /dev/swarco/rs422       -> /dev/ttyAT5
# ---------------------------------------------------------------------------------------------------------------------

if [ "x$PLATFORM" == "xSwarco_SCC_3G" ]
then
    echo " * Naming the hardware interfaces for SCC-Air"

    echo "   > /dev/ttyAT0 linked to $DEV_SWARCO/console"
    ln -s /dev/ttyAT0 $DEV_SWARCO/console

    echo "   > /dev/ttyAT1 not in uses"
#    ln -s /dev/ttyAT1 $DEV_SWARCO/modem

    echo "   > /dev/ttyAT2 linked to $DEV_SWARCO/rs232"
    ln -s /dev/ttyAT2 $DEV_SWARCO/rs232

    echo "   > /dev/ttyAT3 linked to $DEV_SWARCO/bluetooth"
    ln -s /dev/ttyAT3 $DEV_SWARCO/bluetooth

    echo "   > /dev/ttyAT4 linked to $DEV_SWARCO/rs485"
    ln -s /dev/ttyAT4 $DEV_SWARCO/rs485

    echo "   > /dev/ttyAT5 linked to $DEV_SWARCO/rs422"
    ln -s /dev/ttyAT5 $DEV_SWARCO/rs422
fi

# ---------------------------------------------------------------------------------------------------------------------
# TODO: review
# SCC-SHDSL2
#     /dev/swarco/console     -> /dev/ttyAT0
#     /dev/swarco/modem       -> /dev/ttyAT1
#     /dev/swarco/rs232_1     -> /dev/ttyAT2
#     /dev/swarco/rs232_2     -> /dev/ttyAT3
#     /dev/swarco/rs485       -> /dev/ttyAT4
#     /dev/swarco/rs422       -> /dev/ttyAT5
# ---------------------------------------------------------------------------------------------------------------------

if [ "x$PLATFORM" == "xSwarco_SCC_SHDSL2" ]
then
    echo " * Naming the hardware interfaces for SCC-SHDSL2"

    echo "   > /dev/ttyAT0 linked to $DEV_SWARCO/console"
    ln -s /dev/ttyAT0 $DEV_SWARCO/console

    echo "   > /dev/ttyAT1 linked to $DEV_SWARCO/modem"
    ln -s /dev/ttyAT0 $DEV_SWARCO/modem

    echo "   > /dev/ttyAT2 linked to $DEV_SWARCO/rs232_1"
    ln -s /dev/ttyAT2 $DEV_SWARCO/rs232_1

    echo "   > /dev/ttyAT3 linked to $DEV_SWARCO/rs232_2"
    ln -s /dev/ttyAT3 $DEV_SWARCO/rs232_2

    echo "   > /dev/ttyAT4 linked to $DEV_SWARCO/rs485"
    ln -s /dev/ttyAT4 $DEV_SWARCO/rs485

    echo "   > /dev/ttyAT5 linked to $DEV_SWARCO/rs485"
    ln -s /dev/ttyAT5 $DEV_SWARCO/rs485
fi

# ---------------------------------------------------------------------------------------------------------------------
# SCC-Fiber-SAMA5
#     /dev/swarco/console     -> /dev/ttyS0 (Not linked)
#     /dev/swarco/detector    -> /dev/ttyS1
#     /dev/swarco/io          -> /dev/ttyS2
#     /dev/swarco/modem       -> /dev/ttyS3
#     /dev/swarco/rs232_1     -> /dev/ttyS4
#     /dev/swarco/rs232_2     -> /dev/ttyS5
#     /dev/swarco/led_status  -> /sys/devices/soc0/gpioleds/leds/status1/brightness
# ---------------------------------------------------------------------------------------------------------------------

if [ "x$PLATFORM" == "xswarco-fiberrouter-sama5" ]
then
    echo " * Naming the hardware interfaces for SCC-Fiber-SAMA5"

#    echo "   > /dev/ttyS0 linked to $DEV_SWARCO/console"
#    ln -s /dev/ttyS0 $DEV_SWARCO/console

    echo "   > /dev/ttyS1 linked to $DEV_SWARCO/rs485"
    ln -s /dev/ttyS1 $DEV_SWARCO/rs485

    echo "   > /dev/ttyS2 linked to $DEV_SWARCO/rs422"
    ln -s /dev/ttyS2 $DEV_SWARCO/rs422

    echo "   > /dev/ttyS3 linked to $DEV_SWARCO/modem"
    ln -s /dev/ttyS3 $DEV_SWARCO/modem

    echo "   > /dev/ttyS4 linked to $DEV_SWARCO/rs232_1"
    ln -s /dev/ttyS4 $DEV_SWARCO/rs232_1

    echo "   > /dev/ttyS5 linked to $DEV_SWARCO/rs232_2"
    ln -s /dev/ttyS5 $DEV_SWARCO/rs232_2

    echo "   > /sys/.../leds/status1/brightness linked to $DEV_SWARCO/led_status"
    ln -s /sys/devices/soc0/gpioleds/leds/status1/brightness $DEV_SWARCO/led_status
fi

# ---------------------------------------------------------------------------------------------------------------------
# SCC-Ethernet-SAMA5
#     /dev/swarco/console     -> /dev/ttyS0 (Not linked)
#     /dev/swarco/rs485       -> /dev/ttyS1
#     /dev/swarco/rs422       -> /dev/ttyS2
#     /dev/swarco/modem       -> /dev/ttyS3
#     /dev/swarco/rs232_1     -> /dev/ttyS4
#     /dev/swarco/rs232_2     -> /dev/ttyS5
#     /dev/swarco/led_status  -> /sys/devices/soc0/gpioleds/leds/status1/brightness
# ---------------------------------------------------------------------------------------------------------------------

if [ "x$PLATFORM" == "xswarco-ethernetrouter-sama5" ]
then
    echo " * Naming the hardware interfaces for SCC-Ethernet-SAMA5"

#    echo "   > /dev/ttyS0 linked to $DEV_SWARCO/console"
#    ln -s /dev/ttyS0 $DEV_SWARCO/console

    echo "   > /dev/ttyS1 linked to $DEV_SWARCO/rs485"
    ln -s /dev/ttyS1 $DEV_SWARCO/rs485

    echo "   > /dev/ttyS2 linked to $DEV_SWARCO/rs422"
    ln -s /dev/ttyS2 $DEV_SWARCO/rs422

    echo "   > /dev/ttyS3 linked to $DEV_SWARCO/modem"
    ln -s /dev/ttyS3 $DEV_SWARCO/modem

    echo "   > /dev/ttyS4 linked to $DEV_SWARCO/rs232_1"
    ln -s /dev/ttyS4 $DEV_SWARCO/rs232_1

    echo "   > /dev/ttyS5 linked to $DEV_SWARCO/rs232_2"
    ln -s /dev/ttyS5 $DEV_SWARCO/rs232_2

    echo "   > /sys/.../leds/status1/brightness linked to $DEV_SWARCO/led_status"
    ln -s /sys/devices/soc0/gpioleds/leds/status1/brightness $DEV_SWARCO/led_status
fi

# ---------------------------------------------------------------------------------------------------------------------
# Swarco Heimdall board
#     /dev/swarco/console     -> /dev/ttyS0 (Not linked)
#     /dev/swarco/rs485_1     -> /dev/ttyS1
#     /dev/swarco/rs485_2     -> /dev/ttyS2
#     /dev/swarco/rs232       -> /dev/ttyS5
#
#     ADC
#       /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/...
#     /dev/swarco/adc/scale          -> .../in_voltage_scale
#     /dev/swarco/adc/voltage0_raw   -> .../in_voltage0_raw
#     /dev/swarco/adc/voltage1_raw   -> .../in_voltage1_raw
# ---------------------------------------------------------------------------------------------------------------------

if [ "x$PLATFORM" == "xswarco-heimdall-sama5" ]
then
    echo " * Naming the hardware interfaces for Heimdall"

#    echo "   > /dev/ttyS0 linked to $DEV_SWARCO/console"
#    ln -s /dev/ttyS0 $DEV_SWARCO/console

    echo "   > /dev/ttyS1 linked to $DEV_SWARCO/rs485_1"
    ln -s /dev/ttyS1 $DEV_SWARCO/rs485_1

    echo "   > /dev/ttyS2 linked to $DEV_SWARCO/rs485_2"
    ln -s /dev/ttyS2 $DEV_SWARCO/rs485_2

    echo "   > /dev/ttyS5 linked to $DEV_SWARCO/rs232"
    ln -s /dev/ttyS5 $DEV_SWARCO/rs232

    echo "   > /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/... "
    echo "     .../in_voltage_scale linked to $DEV_SWARCO/adc/scale"
    ln -s /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/in_voltage_scale $DEV_SWARCO/scale

    echo "     .../in_voltage0_raw linked to $DEV_SWARCO/adc/voltage0_raw"
    ln -s /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/in_voltage0_raw $DEV_SWARCO/voltage0_raw

    echo "     .../in_voltage1_raw linked to $DEV_SWARCO/adc/voltage1_raw"
    ln -s /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/in_voltage1_raw $DEV_SWARCO/voltage1_raw
fi

# ---------------------------------------------------------------------------------------------------------------------
# Swarco SCC-Air Mk.II
#     /dev/swarco/console     -> /dev/ttyS0 (Not linked)
#     /dev/swarco/rs485_1     -> /dev/ttyS1
#     /dev/swarco/rs485_3     -> /dev/ttyS2
#     /dev/swarco/modem       -> /dev/ttyS3
#     /dev/swarco/rs485_2     -> /dev/ttyS4
#     /dev/swarco/rs232       -> /dev/ttyS5
#     /dev/swarco/exp_uart    -> /dev/ttyS6
#
#     ADC
#       /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/...
#     /dev/swarco/adc/scale                     -> .../in_voltage_scale
#     /dev/swarco/adc/current_usage_max_1A      -> .../in_voltage0_raw
#     /dev/swarco/adc/supply_voltage_max_30V    -> .../in_voltage1_raw
#     /dev/swarco/adc/battery_voltage_max_15V   -> .../in_voltage2_raw
#     /dev/swarco/adc/exp_adc_1                 -> .../in_voltage6_raw
#     /dev/swarco/adc/exp_adc_2                 -> .../in_voltage7_raw
# ---------------------------------------------------------------------------------------------------------------------

if [ "x$PLATFORM" == "xswarco-scc-air-mk2-sama5" ]
then
    echo " * Naming the hardware interfaces for SCC-Air Mk.II"

    echo "   > /dev/ttyS1 linked to $DEV_SWARCO/rs485_1"
    ln -s /dev/ttyS1 $DEV_SWARCO/rs485_1

    echo "   > /dev/ttyS2 linked to $DEV_SWARCO/rs485_3"
    ln -s /dev/ttyS2 $DEV_SWARCO/rs485_3

    echo "   > /dev/ttyS3 linked to $DEV_SWARCO/modem"
    ln -s /dev/ttyS3 $DEV_SWARCO/modem

    echo "   > /dev/ttyS4 linked to $DEV_SWARCO/rs485_2"
    ln -s /dev/ttyS4 $DEV_SWARCO/rs485_2

    echo "   > /dev/ttyS5 linked to $DEV_SWARCO/rs232"
    ln -s /dev/ttyS5 $DEV_SWARCO/rs232

    echo "   > /dev/ttyS6 linked to $DEV_SWARCO/exp_uart"
    ln -s /dev/ttyS6 $DEV_SWARCO/exp_uart


    echo "   > /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/... "
    echo "     .../in_voltage_scale linked to $DEV_ADC_SWARCO/scale"
    ln -s /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/in_voltage_scale $DEV_ADC_SWARCO/scale

    echo "     .../in_voltage0_raw linked to $DEV_ADC_SWARCO/current_usage_max_1A"
    ln -s /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/in_voltage0_raw $DEV_ADC_SWARCO/current_usage_max_1A

    echo "     .../in_voltage1_raw linked to $DEV_ADC_SWARCO/supply_voltage_max_30V"
    ln -s /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/in_voltage1_raw $DEV_ADC_SWARCO/supply_voltage_max_30V

    echo "     .../in_voltage2_raw linked to $DEV_ADC_SWARCO/battery_voltage_max_15V"
    ln -s /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/in_voltage2_raw $DEV_ADC_SWARCO/battery_voltage_max_15V

    echo "     .../in_voltage6_raw linked to $DEV_ADC_SWARCO/exp_adc_1"
    ln -s /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/in_voltage6_raw $DEV_ADC_SWARCO/exp_adc_1

    echo "     .../in_voltage7_raw linked to $DEV_ADC_SWARCO/exp_adc_2"
    ln -s /sys/devices/soc0/ahb/ahb:apb/f8018000.adc/iio:device0/in_voltage7_raw $DEV_ADC_SWARCO/exp_adc_2
fi

echo -n "   "

