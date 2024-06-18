#!/system/bin/sh

target=`getprop ro.board.platform`

start_vm_bms()
{
	if [ -e /dev/vm_bms ]; then
		chown -h root.system /sys/class/power_supply/bms/current_now
		chown -h root.system /sys/class/power_supply/bms/voltage_ocv
		chmod 0664 /sys/class/power_supply/bms/current_now
		chmod 0664 /sys/class/power_supply/bms/voltage_ocv
		start vm_bms
	fi
}

case "$target" in
    "msm8916")
        start_vm_bms
        ;;
    "msm8909")
        start_vm_bms
        ;;
esac
