#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a05s

# Inherit from device.mk configuration
$(call inherit-product, $(DEVICE_PATH)/device.mk)

# Release name
PRODUCT_RELEASE_NAME := a05s

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := a05s
PRODUCT_NAME := twrp_a05s
PRODUCT_BRAND := samsung
PRODUCT_MODEL := SM-A057F
PRODUCT_MANUFACTURER := samsung

PRODUCT_GMS_CLIENTID_BASE := android-samsung-ss
