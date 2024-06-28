# Copyright (C) 2012 The Android Open Source Project
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

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/htc/a16/a16-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/htc/a16/overlay

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/htc/a16/device.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := lineage_a16
PRODUCT_BRAND := htc
PRODUCT_DEVICE := a16
PRODUCT_MODEL := a16
PRODUCT_MANUFACTURER := htc
