$(call inherit-product, device/qcom/msm8909-common/msm8909.mk)

$(call inherit-product-if-exists, vendor/htc/a16/a16-vendor.mk)

TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

$(call inherit-product-if-exists, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

PRODUCT_PACKAGES += \
    A16OverlayFrameworksRes \
    A16OverlaySystemUI

PRODUCT_PACKAGES += \
    android.hardware.gatekeeper@1.0-impl \
    android.hardware.keymaster@3.0-impl \
    android.hardware.keymaster@3.0-service \
    keystore.msm8909

PRODUCT_PACKAGES += \
    liblog_htc_shim

PRODUCT_COPY_FILES += \
    device/htc/a16/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_VENDOR)/etc/fstab.qcom \
    device/htc/a16/rootdir/etc/init.device.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/hw/init.device.rc \
    device/htc/a16/rootdir/bin/htc-fw-link.sh:$(TARGET_COPY_OUT_VENDOR)/bin/htc-fw-link.sh \
    device/htc/a16/rootdir/bin/htc-wifi-mac.sh:$(TARGET_COPY_OUT_VENDOR)/bin/htc-wifi-mac.sh

PRODUCT_COPY_FILES += \
    device/htc/a16/rootdir/usr/keylayout/gpio-keys.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/gpio-keys.kl \
    device/htc/a16/rootdir/usr/keylayout/himax-touchscreen.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/himax-touchscreen.kl \
    device/htc/a16/rootdir/usr/keylayout/synaptics_dsx.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/synaptics_dsx.kl \
    device/htc/a16/rootdir/usr/keylayout/synaptics_rmi4_i2c.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/synaptics_rmi4_i2c.kl \
    device/htc/a16/rootdir/usr/keylayout/atmel_mxt_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/atmel_mxt_ts.kl \
    device/htc/a16/rootdir/usr/keylayout/ft5x06_ts.kl:$(TARGET_COPY_OUT_VENDOR)/usr/keylayout/ft5x06_ts.kl

A16_ENABLE_NFC := false

ifeq ($(A16_ENABLE_NFC),true)
PRODUCT_PACKAGES += \
    android.hardware.nfc@1.2-service \
    NfcNci \
    Tag

PRODUCT_COPY_FILES += \
    hardware/nxp/nfc/halimpl/libnfc-nci.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nci.conf \
    device/htc/a16/configs/nfc/libnfc-nxp.conf:$(TARGET_COPY_OUT_VENDOR)/etc/libnfc-nxp.conf \
    device/htc/a16/configs/nfc/nfcee_access.xml:$(TARGET_COPY_OUT_VENDOR)/etc/nfcee_access.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.nfc.hce.xml
endif

PRODUCT_PACKAGES += \
    libwcnss_qmi

PRODUCT_COPY_FILES += \
    device/htc/a16/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml
