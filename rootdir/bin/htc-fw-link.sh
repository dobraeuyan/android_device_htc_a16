#!/vendor/bin/sh

set -e
LINK=/mnt/vendor/fwlink
mkdir -p "$LINK" 2>/dev/null || true

umask 022

for f in /mnt/vendor/fwmt/* /mnt/vendor/fwwc/*; do
    [ -f "$f" ] && cp -f "$f" "$LINK/"
done

for r in /sys/bus/msm_subsys/devices/subsys*/restart_level; do
    [ -f "$r" ] && printf '%s' RELATED > "$r"
done

printf '%s' "$LINK" > /sys/module/firmware_class/parameters/path
