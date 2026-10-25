#!/vendor/bin/sh

SYSNODE=$(find /sys/devices/platform/soc -name wcnss_mac_addr 2>/dev/null | head -n 1)
if [ -z "$SYSNODE" ]; then
    echo "htc-wifi-mac: no encuentro el nodo sysfs wcnss_mac_addr"
    exit 0
fi

MAC=$(sed -n 's/^macaddr=\([0-9a-fA-F:]*\).*/\1/p' /proc/calibration)
if [ -z "$MAC" ]; then
    echo "htc-wifi-mac: /proc/calibration sin macaddr (¿falta /calibration_data en el DT?)"
    exit 0
fi

printf '%s\n' "$MAC" > "$SYSNODE"
echo "htc-wifi-mac: MAC de fábrica $MAC -> $SYSNODE"