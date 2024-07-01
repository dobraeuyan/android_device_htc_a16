#
# Copyright (C) 2012 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Boot animation
TARGET_SCREEN_HEIGHT := 1280
TARGET_SCREEN_WIDTH := 720

# Release name
PRODUCT_RELEASE_NAME := a16

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/htc/a16/device_a16.mk)

# Device identifier. This must come after all inclusions
PRODUCT_NAME := lineage_a16
PRODUCT_BRAND := htc
PRODUCT_DEVICE := a16
PRODUCT_MODEL := a16
PRODUCT_MANUFACTURER := htc

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=htc/a16ul_00617/htc_a16ul:6.0.1/MMB29M/766079.27:user/release-keys \
	PRIVATE_BUILD_DESC="1.01.617.27 CL766079 release-keys"
