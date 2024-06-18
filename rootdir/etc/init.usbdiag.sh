#!/system/bin/sh
#set diag permissions
    chown radio.qcom_diag /dev/htc_diag
    chown radio.qcom_diag /dev/diag
    chown radio.qcom_diag /dev/diag_mdm
    chown radio.qcom_diag /dev/htcdiag
    chown radio.qcom_diag /dev/diag_arm9
    chown radio.qcom_diag /dev/btdiag
    chown radio.qcom_diag /dev/diag_qsc
	chown system.system /sys/devices/platform/android_usb/lock_speed
    chmod 0660 /dev/htc_diag
    chmod 0660 /dev/diag
    chmod 0660 /dev/diag_mdm
    chmod 0660 /dev/htcdiag
    chmod 0660 /dev/diag_arm9
    chmod 0660 /dev/btdiag
    chmod 0660 /dev/diag_qsc

# soc_ids for 8916/8939 differentiation
if [ -f /sys/devices/soc0/soc_id ]; then
    soc_id=`cat /sys/devices/soc0/soc_id`
else
    soc_id=`cat /sys/devices/system/soc/soc0/id`
fi

# enable rps cpus on msm8939/msm8909/msm8929 target
setprop sys.usb.rps_mask 0
case "$soc_id" in
    "239" | "241" | "263" | "268" | "269" | "270")
        setprop sys.usb.rps_mask 10
    ;;
    "245" | "258" | "259" | "265" | "275")
        setprop sys.usb.rps_mask 4
    ;;
esac
