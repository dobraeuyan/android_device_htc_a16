#!/system/bin/sh

# start ril-daemon only for targets on which radio is present
baseband=`getprop ro.baseband`
sgltecsfb=`getprop persist.radio.sglte_csfb`
datamode=`getprop persist.data.mode`
netmgr=`getprop ro.use_data_netmgrd`

case "$baseband" in
    "apq")
    setprop ro.radio.noril yes
    stop ril-daemon
esac

case "$baseband" in
    "msm" | "csfb" | "svlte2a" | "mdm" | "mdm2" | "sglte" | "sglte2" | "dsda2" | "unknown" | "dsda3")
    start qmuxd
    #start ipacm-diag
    #start ipacm
    case "$baseband" in
        "svlte2a" | "csfb")
          start qmiproxy
        ;;
        "sglte" | "sglte2" )
          if [ "x$sgltecsfb" != "xtrue" ]; then
              start qmiproxy
          else
              setprop persist.radio.voice.modem.index 0
          fi
        ;;
        "dsda2")
          setprop persist.radio.multisim.config dsda
    esac

    multisim=`getprop persist.radio.multisim.config`

    if [ "$multisim" = "dsds" ] || [ "$multisim" = "dsda" ]; then
        start ril-daemon2
    elif [ "$multisim" = "tsts" ]; then
        start ril-daemon2
        start ril-daemon3
    fi

    case "$datamode" in
        "tethered")
            #start qti
            start port-bridge
            ;;
        "concurrent")
            #start qti
            if [ "$netmgr" = "true" ]; then
                start netmgrd
            fi
            ;;
        *)
            if [ "$netmgr" = "true" ]; then
                start netmgrd
            fi
            ;;
    esac
esac
