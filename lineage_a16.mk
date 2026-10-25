WITH_ADB_INSECURE := true

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

$(call inherit-product, device/htc/a16/a16.mk)

$(call inherit-product, device/qcom/msm8909-common/ril.mk)
$(call inherit-product, vendor/qcom/msm8909-common/msm8909-ril-vendor.mk)

$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_GMS_CLIENTID_BASE := android-htc
PRODUCT_NAME := lineage_a16
PRODUCT_DEVICE := a16
PRODUCT_BRAND := htc
PRODUCT_MANUFACTURER := HTC
PRODUCT_MODEL := HTC Desire 530
