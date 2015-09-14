#!/system/bin/sh
# Plumb down the device serial number
if [ ! -f /persist/wlan_mac_serial.bin ]; then
validSerial=`getprop ro.serialno | md5sum`
validSerial=000AF5${validSerial:0:6}
echo $validSerial > /persist/wlan_mac_serial.bin
fi
