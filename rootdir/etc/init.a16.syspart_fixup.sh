#!/system/bin/sh

target="$1"
serial="$2"

# No path is set up at this point so we have to do it here.
PATH=/sbin:/system/sbin:/system/bin:/system/xbin
export PATH

mount_needed=false;

if [ ! -f /system/etc/boot_fixup ];then
# This should be the first command
# remount system as read-write.
  mount -o rw,remount,barrier=1 /system
  mount_needed=true;
fi

touch /system/etc/boot_fixup

if $mount_needed ;then
# This should be the last command
# remount system as read-only.
  mount -o ro,remount,barrier=1 /system
fi
