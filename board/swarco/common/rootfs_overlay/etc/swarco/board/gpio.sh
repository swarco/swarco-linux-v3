#!/bin/sh
#

GPIO_DIR="/dev/swarco/gpio"

SAFETY_REALAY="swarcocpu-relay"
MODEM_CONTROL="modem_control"
USB_VBUS_FRONT="usb_5v_on"

mkdir -p $GPIO_DIR

echo " > Exporting GPIOs"

if [ "x$PLATFORM" == "xswarco-itc3-sama5" ]
then
    echo " * Configuring gpio for ITC3 CPU ... "

    echo "   > pioB27 OUTPUT linked to $GPIO_DIR/$SAFETY_REALAY"
    echo 59 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioB27/direction
    ln -s /sys/class/gpio/pioB27/value $GPIO_DIR/$SAFETY_REALAY

    echo "   > pioE15 OUTPUT linked to $GPIO_DIR/TP10 "
    echo 143 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioE15/direction
    ln -s /sys/class/gpio/pioE15/value $GPIO_DIR/TP10
    echo " OK "
fi

if [ "x$PLATFORM" == "xswarco-ethernetrouter-sama5" -o "x$PLATFORM" == "xswarco-fiberrouter-sama5" ]
then
    echo " * Configuring gpio for SCC ether/fiber router ... "

    echo "   > pioA14 OUTPUT linked to $GPIO_DIR/modem_status"
    echo 14  >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioA14/active_low
    ln -s     /sys/class/gpio/pioA14/value      $GPIO_DIR/modem_status

    echo "   > pioA24 OUTPUT linked to $GPIO_DIR/modem_pwrmon"
    echo 24  >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioA24/active_low
    ln -s     /sys/class/gpio/pioA24/value      $GPIO_DIR/modem_pwrmon

    echo "   > pioD5 OUTPUT linked to $GPIO_DIR/modem_onoff"
    echo 101 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioD5/direction
    ln -s     /sys/class/gpio/pioD5/value       $GPIO_DIR/modem_onoff

    echo "   > pioD24 OUTPUT linked to $GPIO_DIR/modem_vbus"
    echo 120 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioD24/direction
    ln -s     /sys/class/gpio/pioD24/value      $GPIO_DIR/modem_vbus

    echo "   > pioD25 OUTPUT linked to $GPIO_DIR/modem_reset"
    echo 121 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioD25/direction
    ln -s     /sys/class/gpio/pioD25/value      $GPIO_DIR/modem_reset

    echo "   > pioE10 OUTPUT linked to $GPIO_DIR/id_modem_4g"
    echo 138 >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioE10/active_low
    ln -s     /sys/class/gpio/pioE10/value      $GPIO_DIR/id_modem_4g

    echo "   > pioE16 OUTPUT linked to $GPIO_DIR/id_modem_3g"
    echo 144 >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioE16/active_low
    ln -s     /sys/class/gpio/pioE16/value      $GPIO_DIR/id_modem_3g

    echo "   > pioA28 OUTPUT linked to $GPIO_DIR/aux_psu_on"
    echo 28  >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioA28/direction
    ln -s     /sys/class/gpio/pioA28/value      $GPIO_DIR/aux_psu_on

    echo "   > pioA30 OUTPUT linked to $GPIO_DIR/aux_psu_12v"
    echo 30  >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioA30/direction
    ln -s     /sys/class/gpio/pioA30/value      $GPIO_DIR/aux_psu_12v

    echo "   > Switch tailtagging control linked to $GPIO_DIR/tailtagging"
    ln -s     /sys/class/spi_master/spi32766/spi32766.0/tailtagging     $GPIO_DIR/tailtagging
    echo " OK "
fi

if [ "x$PLATFORM" == "xswarco-itc2.5-sama5" ]
then
    echo "   > pioC24 OUTPUT linked to $GPIO_DIR/$USB_VBUS_FRONT"
    if [ ! -e /sys/class/gpio/pioC24/value ]; then
        echo 88  >/sys/class/gpio/export
        echo 1   >/sys/class/gpio/pioC24/active_low
        echo out >/sys/class/gpio/pioC24/direction
        ln -s /sys/class/gpio/pioC24/value $GPIO_DIR/$USB_VBUS_FRONT
    else
    # skip gpio export as it has allready been done during boot
        ln -s /sys/class/gpio/pioC24/value $GPIO_DIR/$USB_VBUS_FRONT
    fi

    echo "   > pioA4 OUTPUT linked to $GPIO_DIR/$MODEM_CONTROL"
    echo 4   >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioA4/active_low
    echo out >/sys/class/gpio/pioA4/direction
    echo 1   >/sys/class/gpio/pioA4/value
    ln -s /sys/class/gpio/pioA4/value $GPIO_DIR/$MODEM_CONTROL

    echo "   > pioD19 OUTPUT linked to $GPIO_DIR/$SAFETY_REALAY"
    echo 115 >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioD19/active_low
    echo out >/sys/class/gpio/pioD19/direction
    echo 0   >/sys/class/gpio/pioD19/value
    ln -s /sys/class/gpio/pioD19/value $GPIO_DIR/$SAFETY_REALAY

    echo "   > pioB13 OUTPUT linked to $GPIO_DIR/TP4"
    echo 45  >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioB13/direction
    ln -s /sys/class/gpio/pioB13/value $GPIO_DIR/TP4

    echo "   > pioB7 OUTPUT linked to $GPIO_DIR/TP5"
    echo 39  >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioB7/direction
    ln -s /sys/class/gpio/pioB7/value $GPIO_DIR/TP5

    echo "   > pioE6 OUTPUT linked to $GPIO_DIR/TP6"
    echo 134 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioE6/direction
    ln -s /sys/class/gpio/pioE6/value $GPIO_DIR/TP6

    echo "   > pioE15 OUTPUT linked to $GPIO_DIR/TP7"
    echo 143 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioE15/direction
    ln -s /sys/class/gpio/pioE15/value $GPIO_DIR/TP7

    echo "   > pioE15 OUTPUT linked to $GPIO_DIR/TP8"
    echo 159 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioE31/direction
    ln -s /sys/class/gpio/pioE31/value $GPIO_DIR/TP8
    echo " OK "
fi

if [ "x$PLATFORM" == "xSwarcoCPU" ]
then
    echo " * /sys/class/swarcoio/itc_modem_onoff gpio OUTPUT linked to $GPIO_DIR/$MODEM_CONTROL"
    echo 0   >/sys/class/swarcoio/itc_modem_onoff
    ln -s /sys/class/swarcoio/itc_modem_onoff $GPIO_DIR/$MODEM_CONTROL

    echo " * /proc/swarcocpu-relay OUTPUT linked to $GPIO_DIR/$SAFETY_REALAY"
    ln -s /proc/swarcocpu-relay $GPIO_DIR/$SAFETY_REALAY
    echo " OK "
fi

if [ "x$PLATFORM" == "xswarco-heimdall-sama5" ]
then
    echo "   > pioE28 OUTPUT linked to $GPIO_DIR/dig_out_0"
    echo 156 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioE28/direction
    echo 0   >/sys/class/gpio/pioE28/value
    ln -s /sys/class/gpio/pioE28/value $GPIO_DIR/dig_out_0

    echo "   > pioE29 OUTPUT linked to $GPIO_DIR/dig_out_1"
    echo 157 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioE29/direction
    echo 0   >/sys/class/gpio/pioE29/value
    ln -s /sys/class/gpio/pioE29/value $GPIO_DIR/dig_out_1

    echo "   > pioE30 OUTPUT linked to $GPIO_DIR/dig_out_2"
    echo 158 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioE30/direction
    echo 0   >/sys/class/gpio/pioE30/value
    ln -s /sys/class/gpio/pioE30/value $GPIO_DIR/dig_out_2

    echo "   > pioE31 OUTPUT linked to $GPIO_DIR/dig_out_3"
    echo 159 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioE31/direction
    echo 0   >/sys/class/gpio/pioE31/value
    ln -s /sys/class/gpio/pioE31/value $GPIO_DIR/dig_out_3

    echo "   > pioD20 OUTPUT linked to $GPIO_DIR/dig_in_0"
    echo 116 >/sys/class/gpio/export
    ln -s /sys/class/gpio/pioD20/value $GPIO_DIR/dig_in_0

    echo "   > pioD21 OUTPUT linked to $GPIO_DIR/dig_in_1"
    echo 117 >/sys/class/gpio/export
    ln -s /sys/class/gpio/pioD21/value $GPIO_DIR/dig_in_1

    echo "   > pioD22 OUTPUT linked to $GPIO_DIR/dig_in_2"
    echo 118 >/sys/class/gpio/export
    ln -s /sys/class/gpio/pioD22/value $GPIO_DIR/dig_in_2

    echo "   > pioD23 OUTPUT linked to $GPIO_DIR/dig_in_3"
    echo 119 >/sys/class/gpio/export
    ln -s /sys/class/gpio/pioD23/value $GPIO_DIR/dig_in_3

    echo "   > pioE6 OUTPUT linked to $GPIO_DIR/TP1"
    echo 134 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioE6/direction
    ln -s /sys/class/gpio/pioE6/value $GPIO_DIR/TP1

    echo "   > pioD19 OUTPUT linked to $GPIO_DIR/TP6"
    echo 115 >/sys/class/gpio/export
    ln -s /sys/class/gpio/pioD20/value $GPIO_DIR/TP6

    echo " OK "
fi

if [ "x$PLATFORM" == "xswarco-scc-air-mk2-sama5" ]
then

    echo "   > pioE0 OUTPUT linked to $GPIO_DIR/buzzer"
    echo 128 >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioE0/active_low
    echo out >/sys/class/gpio/pioE0/direction
    echo 0   >/sys/class/gpio/pioE0/value
    ln -s     /sys/class/gpio/pioE0/value      $GPIO_DIR/buzzer

    echo "   > pioB19 OUTPUT linked to $GPIO_DIR/dig_in_0"
    echo 51 >/sys/class/gpio/export
    ln -s /sys/class/gpio/pioB19/value $GPIO_DIR/dig_in_0

    echo "   > pioB20 OUTPUT linked to $GPIO_DIR/dig_in_1"
    echo 52 >/sys/class/gpio/export
    ln -s /sys/class/gpio/pioB20/value $GPIO_DIR/dig_in_1

    echo "   > pioB21 OUTPUT linked to $GPIO_DIR/dig_in_2"
    echo 53 >/sys/class/gpio/export
    ln -s /sys/class/gpio/pioB21/value $GPIO_DIR/dig_in_2

    echo "   > pioB22 OUTPUT linked to $GPIO_DIR/dig_in_3"
    echo 54 >/sys/class/gpio/export
    ln -s /sys/class/gpio/pioB22/value $GPIO_DIR/dig_in_3

    echo "   > pioB23 OUTPUT linked to $GPIO_DIR/dig_in_4"
    echo 55 >/sys/class/gpio/export
    ln -s /sys/class/gpio/pioB23/value $GPIO_DIR/dig_in_4

    echo "   > pioC10 OUTPUT linked to $GPIO_DIR/exp_in_1"
    echo 74 >/sys/class/gpio/export
    ln -s /sys/class/gpio/pioC10/value $GPIO_DIR/exp_in_1

    echo "   > pioC18 OUTPUT linked to $GPIO_DIR/exp_out_1"
    echo 82 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioC18/direction
    ln -s /sys/class/gpio/pioC18/value $GPIO_DIR/exp_out_1

    echo "   > pioA14 OUTPUT linked to $GPIO_DIR/modem_status"
    echo 14  >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioA14/active_low
    ln -s     /sys/class/gpio/pioA14/value      $GPIO_DIR/modem_status

    echo "   > pioA24 OUTPUT linked to $GPIO_DIR/modem_pwrmon"
    echo 24  >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioA24/active_low
    ln -s     /sys/class/gpio/pioA24/value      $GPIO_DIR/modem_pwrmon

    echo "   > pioD5 OUTPUT linked to $GPIO_DIR/modem_onoff"
    echo 101 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioD5/direction
    ln -s     /sys/class/gpio/pioD5/value       $GPIO_DIR/modem_onoff

    echo "   > pioD24 OUTPUT linked to $GPIO_DIR/modem_vbus"
    echo 120 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioD24/direction
    ln -s     /sys/class/gpio/pioD24/value      $GPIO_DIR/modem_vbus

    echo "   > pioD25 OUTPUT linked to $GPIO_DIR/modem_reset"
    echo 121 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioD25/direction
    ln -s     /sys/class/gpio/pioD25/value      $GPIO_DIR/modem_reset

    echo "   > pioE10 OUTPUT linked to $GPIO_DIR/id_modem_4g"
    echo 138 >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioE10/active_low
    ln -s     /sys/class/gpio/pioE10/value      $GPIO_DIR/id_modem_4g

    echo "   > pioE16 OUTPUT linked to $GPIO_DIR/id_modem_3g"
    echo 144 >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioE16/active_low
    ln -s     /sys/class/gpio/pioE16/value      $GPIO_DIR/id_modem_3g

    echo "   > pioE8 OUTPUT linked to $GPIO_DIR/can_reol"
    echo 136 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioE8/direction
    ln -s /sys/class/gpio/pioE8/value $GPIO_DIR/can_reol

    echo "   > pioD15 OUTPUT linked to $GPIO_DIR/rs485_1_reol"
    echo 111 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioD15/direction
    ln -s /sys/class/gpio/pioD15/value $GPIO_DIR/rs485_1_reol

    echo "   > pioE20 OUTPUT linked to $GPIO_DIR/rs485_2_reol"
    echo 148 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioE20/direction
    ln -s /sys/class/gpio/pioE20/value $GPIO_DIR/rs485_2_reol

    echo "   > pioB24 OUTPUT linked to $GPIO_DIR/rs422_rs485_3_rx_reol"
    echo 56 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioB24/direction
    ln -s /sys/class/gpio/pioB24/value $GPIO_DIR/rs422_rs485_3_rx_reol

    echo "   > pioB25 OUTPUT linked to $GPIO_DIR/rs422_rs485_3_tx_reol"
    echo 57 >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioB25/direction
    ln -s /sys/class/gpio/pioB25/value $GPIO_DIR/rs422_rs485_3_tx_reol

    echo "   > pioB26 OUTPUT linked to $GPIO_DIR/rs422_rs485_3_half_duplex"
    echo 58  >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioB26/active_low
    echo out >/sys/class/gpio/pioB26/direction
    ln -s /sys/class/gpio/pioB26/value $GPIO_DIR/rs422_rs485_3_half_duplex

    echo "   > pioA5 OUTPUT linked to $GPIO_DIR/batt_on"
    echo 5   >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioA5/direction
    ln -s     /sys/class/gpio/pioA5/value       $GPIO_DIR/batt_on

    echo "   > pioA7 OUTPUT linked to $GPIO_DIR/batt_changer_on"
    echo 7   >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioA7/direction
    ln -s     /sys/class/gpio/pioA7/value       $GPIO_DIR/batt_changer_on

    echo "   > pioC14 OUTPUT linked to $GPIO_DIR/software_reset"
    echo 78  >/sys/class/gpio/export
    echo 1   >/sys/class/gpio/pioC14/active_low
    ln -s     /sys/class/gpio/pioC14/value      $GPIO_DIR/software_reset

    echo "   > pioA28 OUTPUT linked to $GPIO_DIR/aux_psu_on"
    echo 28  >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioA28/direction
    ln -s     /sys/class/gpio/pioA28/value      $GPIO_DIR/aux_psu_on

    echo "   > pioA29 OUTPUT linked to $GPIO_DIR/aux_psu_12V"
    echo 29  >/sys/class/gpio/export
    echo out >/sys/class/gpio/pioA29/direction
    ln -s     /sys/class/gpio/pioA29/value      $GPIO_DIR/aux_psu_12V

    echo " OK "
fi
