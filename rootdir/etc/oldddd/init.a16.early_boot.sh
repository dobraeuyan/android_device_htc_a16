#!/system/bin/sh

export PATH=/system/bin

# Set platform variables
if [ -f /sys/devices/soc0/hw_platform ]; then
    soc_hwplatform=`cat /sys/devices/soc0/hw_platform` 2> /dev/null
else
    soc_hwplatform=`cat /sys/devices/system/soc/soc0/hw_platform` 2> /dev/null
fi
if [ -f /sys/devices/soc0/soc_id ]; then
    soc_hwid=`cat /sys/devices/soc0/soc_id` 2> /dev/null
else
    soc_hwid=`cat /sys/devices/system/soc/soc0/id` 2> /dev/null
fi
if [ -f /sys/devices/soc0/platform_version ]; then
    soc_hwver=`cat /sys/devices/soc0/platform_version` 2> /dev/null
else
    soc_hwver=`cat /sys/devices/system/soc/soc0/platform_version` 2> /dev/null
fi
if [ -f /sys/class/graphics/fb0/virtual_size ]; then
    virtual_size=$(echo `cat /sys/class/graphics/fb0/virtual_size` | cut -d',' -f1) 2>/dev/null
fi

platform=`getprop ro.board.platform`
log -t BOOT -p i "MSM target '$platform', SoC '$soc_hwplatform', HwID '$soc_hwid', SoC ver '$soc_hwver', virtual size '$virtual_size'"

# Setup display nodes & permissions
# HDMI can be fb1 or fb2
# Loop through the sysfs nodes and determine
# the HDMI(dtv panel)

function set_perms() {
    #Usage set_perms <filename> <ownership> <permission>
    chown -h $2 $1
    chmod $3 $1
}

for fb_cnt in 0 1 2
do
file=/sys/class/graphics/fb$fb_cnt
dev_file=/dev/graphics/fb$fb_cnt
  if [ -d "$file" ]
  then
    value=`cat $file/msm_fb_type`
    case "$value" in
            "dtv panel")
        set_perms $file/hpd system.graphics 0664
        set_perms $file/res_info system.graphics 0664
        set_perms $file/vendor_name system.graphics 0664
        set_perms $file/product_description system.graphics 0664
        set_perms $file/video_mode system.graphics 0664
        set_perms $file/format_3d system.graphics 0664
        set_perms $file/s3d_mode system.graphics 0664
        set_perms $file/cec/enable system.graphics 0664
        set_perms $file/cec/logical_addr system.graphics 0664
        set_perms $file/cec/rd_msg system.graphics 0664
        set_perms $file/pa system.graphics 0664
        set_perms $file/cec/wr_msg system.graphics 0600
        set_perms $file/hdcp/tp system.graphics 0664
        ln -s $dev_file /dev/graphics/hdmi
    esac
    if [ $fb_cnt -eq 0 ]
    then
        set_perms $file/idle_time system.graphics 0664
        set_perms $file/dynamic_fps system.graphics 0664
        set_perms $file/dyn_pu system.graphics 0664
        set_perms $file/modes system.graphics 0664
        set_perms $file/mode system.graphics 0664
    fi
  fi
done

