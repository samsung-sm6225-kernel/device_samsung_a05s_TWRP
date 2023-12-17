#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := device/samsung/a05s

# Configure base.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Configure core_64_bit_only.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)

# Configure twrp
$(call inherit-product, vendor/twrp/config/common.mk)

# SHIPPING API
PRODUCT_SHIPPING_API_LEVEL := 31

# VNDK API
PRODUCT_TARGET_VNDK_VERSION := 33

# Dynamic partitions
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Support to compile recovery without msm headers
TARGET_HAS_GENERIC_KERNEL_HEADERS := true

# Enable Fuse Passthrough
PRODUCT_PROPERTY_OVERRIDES += persist.sys.fuse.passthrough.enable=true

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd

TWRP_REQUIRED_MODULES += \
    samsung_prebuilt
