#!/system/bin/sh

target="$1"
serial="$2"

PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

mount_needed=false;

if [ ! -f /system/etc/boot_fixup ];then
  mount -o rw,remount,barrier=1 /system
  mount_needed=true;
fi

if [ -f /system/etc/init.modem_a16.sh ]; then
  /system/bin/sh /system/etc/init.modem_a16.sh
fi

touch /system/etc/boot_fixup

if $mount_needed ;then
  mount -o ro,remount,barrier=1 /system
fi
