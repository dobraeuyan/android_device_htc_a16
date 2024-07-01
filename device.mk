$(call inherit-product, frameworks/native/build/phone-hdpi-2048-dalvik-heap.mk)

# Android filesystem
PRODUCT_PACKAGES += \
    fs_config_files


#ANT+ stack
PRODUCT_PACKAGES += \
   AntHalService \
    libantradio \
    com.dsi.ant.antradio_library \
    antradio_app
    
PRODUCT_COPY_FILES += \
    external/ant-wireless/antradio-library/com.dsi.ant.antradio_library.xml:system/etc/permissions/com.dsi.ant.antradio_library.xml
    
# Audio
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcompostprocbundle \
    libqcomvoiceprocessing \
    libaudioroute \
    audio.a2dp.default \
    audio.primary.msm8909 \
    audio.r_submix.default \
    audio.usb.default \
    tinymix
    
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    $(LOCAL_PATH)/configs/audio/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio/mixer_paths.xml:system/etc/mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_mixer_paths.xml:system/etc/sound_trigger_mixer_paths.xml \
    $(LOCAL_PATH)/configs/audio/sound_trigger_platform_info.xml:system/etc/sound_trigger_platform_info.xml \
    $(LOCAL_PATH)/configs/audio/listen_platform_info.xml:system/etc/listen_platform_info.xml

#    $(LOCAL_PATH)/configs/audio/mixer_paths_msm8909_pm8916.xml:system/etc/mixer_paths_msm8909_pm8916.xml \

PRODUCT_PROPERTY_OVERRIDES += \
    audio.offload.disable=1
    
# Bluetooth
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml
    


# Browser
PRODUCT_PACKAGES += \
    Gello

# Camera
PRODUCT_PACKAGES += \
    camera.msm8909 \
    libcamera \
    libqomx_core \
    libmm-qcamera \
    libmmcamera_interface \
    libmmjpeg_interface \
    mm-qcamera-app \
    libxml2 \
    Snap
    
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml

# Dalvik properties
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.heapstartsize=8m \
    dalvik.vm.heapgrowthlimit=192m \
    dalvik.vm.heapsize=256m \
    dalvik.vm.heaptargetutilization=0.75 \
    dalvik.vm.heapminfree=512k \
    dalvik.vm.heapmaxfree=8m

# Display
PRODUCT_PACKAGES += \
    hwcomposer.msm8909 \
    gralloc.msm8909 \
    memtrack.msm8909 \
    copybit.msm8909
        
# EGL implementation
PRODUCT_PACKAGES += \
    libGLES_android

# FM radio
PRODUCT_PACKAGES += \
    FMRadio \
    libfmjni \
    qcom.fmradio
    
# GPS
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    $(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/izat.conf:system/etc/izat.conf \
    $(LOCAL_PATH)/configs/flp.conf:system/etc/flp.conf
    
# Handheld
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml

# Init
PRODUCT_PACKAGES += \
    fstab.qcom \
    fstab.htc_a16 \
    init.class_main.sh \
    init.hosd.common.rc \
    init.hosd_fusion.usb.rc \
    init.hosd.htc_a16.rc \
    init.hosd.usb.rc \
    init.htc_a16.rc \
    init.mdm.sh \
    init.network.sh \
    init.power.rc \
    init.qcom.bms.sh \
    init.qcom.class_core.sh \
    init.qcom.early_boot.sh \
    init.qcom.factory.rc \
    init.qcom.firmware_links.sh \
    init.qcom.rc \
    init.qcom.sh \
    init.qcom.syspart_fixup.sh \
    init.qcom.usb.rc \
    init.recovery.common.rc \
    init.recovery.htc_a16.rc \
    init.target.rc \
    init.usbdiag.sh \
    ueventd.htc_a16.rc \
    ueventd.qcom.rc

PRODUCT_PACKAGES += \
    hcidump.sh \
    hsic.control.bt.sh \
    init.ath3k.bt.sh \
    init.crda.sh \
    init.mocana.sh \
    init.qcom.audio.sh \
    init.qcom.bt.sh \
    init.qcom.coex.sh \
    init.qcom.debug.sh \
    init.qcom.efs.sync.sh \
    init.qcom.fm.sh \
    init.qcom.modem_links.sh \
    init.qcom.post_boot.sh \
    init.qcom.sdio.sh \
    init.qcom.uicc.sh \
    init.qcom.wifi.sh \
    init.qti.ims.sh \
    qca6234-service.sh

# IRSC
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/sec_config:system/etc/sec_config
    
# Keylayout
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/keylayout/atmel_mxt_ts.kl:system/usr/keylayout/atmel_mxt_ts.kl \
    $(LOCAL_PATH)/configs/keylayout/ft5x06_ts.kl:system/usr/keylayout/ft5x06_ts.kl \
    $(LOCAL_PATH)/configs/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    $(LOCAL_PATH)/configs/keylayout/synaptics_dsx.kl:system/usr/keylayout/synaptics_dsx.kl \
    $(LOCAL_PATH)/configs/keylayout/synaptics_rmi4_i2c.kl:system/usr/keylayout/synaptics_rmi4_i2c.kl

# Lights
PRODUCT_PACKAGES += \
    lights.msm8909

# Media
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media/media_profiles_8909.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_8909.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_performance_8909.xml:system/etc/media_codecs_performance.xml \
    $(LOCAL_PATH)/configs/media/media_codecs_sw_vendor.xml:system/etc/media_codecs_sw_vendor.xml
    

PRODUCT_PACKAGES += \
    libstagefrighthw \
    libc2dcolorconvert \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxSwVencMpeg4 \
    libOmxQcelp13Enc \
    libOmxVdec \
    libOmxVenc \
    libextmedia_jni \
    libOmxVdecHevc \
    qcmediaplayer
 
# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    NfcNci \
    nfc_nci.pn54x.default \
    Tag

PRODUCT_COPY_FILES += \
    packages/apps/Nfc/migrate_nfc.txt:system/etc/updatecmds/migrate_nfc.txt \
    frameworks/native/data/etc/com.nxp.mifare.xml:system/etc/permissions/com.nxp.mifare.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    $(LOCAL_PATH)/configs/nfc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    $(LOCAL_PATH)/configs/nfc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    $(LOCAL_PATH)/configs/nfc/nfcee_access.xml:system/etc/nfcee_access.xml \
    $(LOCAL_PATH)/configs/nfc/nfcscc_access.xml:system/etc/nfcscc_access.xml \
    $(LOCAL_PATH)/configs/nfc/nfcse_access.xml:system/etc/nfcse_access.xml
    
# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxSwVencHevc \
    libOmxVdec \
    libOmxVenc \
    libstagefrighthw

# Permissions
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/com.htc.software.market.xml:system/etc/permissions/com.htc.software.market.xml

# Power
PRODUCT_PACKAGES += \
    power.msm8909

PRODUCT_PROPERTY_OVERRIDES += \
    ro.min_freq_0=800000

# QMI
PRODUCT_PACKAGES += \
    dsi_config.xml \
    netmgr_config.xml \
    qmi_config.xml


# Qualcomm dependencies
PRODUCT_PACKAGES += \
    libtinyxml

# RIL
PRODUCT_PACKAGES += \
    libcnefeatureconfig

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREBUILT_DPI := xxhdpi xhdpi hdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Sensors
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    $(LOCAL_PATH)/configs/sensors/hals.conf:system/etc/sensors/hals.conf

# TODO: Check sensors on stock

# Shims
PRODUCT_PACKAGES += \
    liblog_htc
    
#libshim_camera

# Software
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.midi.xml:system/etc/permissions/android.software.midi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.software.webview.xml:system/etc/permissions/android.software.webview.xml

# Telephony
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Thermal
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal-engine.conf:system/etc/thermal-engine.conf
    
# Touchscreen
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml
    
# USB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \

# Wifi
PRODUCT_PACKAGES += \
    libqsap_sdk \
    libQWiFiSoftApCfg \
    libwcnss_qmi \
    libwpa_client \
    hostapd \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf \
    wcnss_service

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    $(LOCAL_PATH)/wifi/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/wifi/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/wifi/hostapd.deny:system/etc/hostapd/hostapd.deny \
    $(LOCAL_PATH)/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    $(LOCAL_PATH)/wifi/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini \
    $(LOCAL_PATH)/wifi/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
    $(LOCAL_PATH)/wifi/WCNSS_wlan_dictionary.dat:system/etc/firmware/wlan/prima/WCNSS_wlan_dictionary.dat

$(call inherit-product-if-exists, vendor/htc/a16/a16-vendor.mk)
