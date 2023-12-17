#
# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 The TWRP Open Source Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/samsung/a05s

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 := 
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := generic

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a9

# UEFI
TARGET_USES_UEFI := true

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := bengal
TARGET_NO_BOOTLOADER := true

# Platform
TARGET_BOARD_PLATFORM := bengal
TARGET_BOARD_PLATFORM_GPU := qcom-adreno610
QCOM_BOARD_PLATFORMS += bengal
BOARD_USES_QCOM_HARDWARE := true

# Display
TARGET_SCREEN_DENSITY := 450

# Kernel
TARGET_KERNEL_ARCH := $(TARGET_ARCH)
TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_INCLUDE_RECOVERY_DTBO := true
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := \
	video=vfb:640x400,bpp=32,memsize=3072000 \
	firmware_class.path=/vendor/firmware_mnt/image \
	printk.devkmsg=on \
	bootconfig \
	androidboot.hardware=qcom \
	androidboot.memcg=1 \
	androidboot.load_modules_parallel=true \
	androidboot.usbcontroller=4e00000.dwc3 \
	loop.max_part=7 \
	androidboot.selinux=permissive

BOARD_KERNEL_PAGESIZE := 4096
BOARD_MKBOOTIMG_ARGS := \
	--dtb $(TARGET_PREBUILT_DTB) \
	--kernel_offset 0x00008000 \
	--ramdisk_offset 0x02000000 \
	--tags_offset 0x01e00000 \
	--dtb_offset 0x01f00000 \
	--header_version 2

# System as root
BOARD_ROOT_EXTRA_FOLDERS := \
	cache \
	carrier \
	data_mirror \
	efs \
	linkerconfig \
	odm_dlkm \
	oem \
	optics \
	postinstall \
	prism \
	second_stage_resources \
	system_ext \
	vendor_dlkm

# Android Verified Boot
BOARD_AVB_ENABLE := true
BOARD_AVB_ROLLBACK_INDEX := $(PLATFORM_SECURITY_PATCH_TIMESTAMP)
BOARD_AVB_RECOVERY_KEY_PATH := external/avb/test/data/testkey_rsa4096.pem
BOARD_AVB_RECOVERY_ALGORITHM := SHA256_RSA4096
BOARD_AVB_RECOVERY_ROLLBACK_INDEX := 1
BOARD_AVB_RECOVERY_ROLLBACK_INDEX_LOCATION := 1
BOARD_AVB_MAKE_VBMETA_IMAGE_ARGS += --flag 3

# Hack: prevent anti rollback
PLATFORM_VERSION := 99.87.36
PLATFORM_VERSION_LAST_STABLE := $(PLATFORM_VERSION)
PLATFORM_SECURITY_PATCH := 2099-12-31
VENDOR_SECURITY_PATCH := $(PLATFORM_SECURITY_PATCH)

# Samsung TS drivers (a05s)
TW_LOAD_VENDOR_MODULES := "lct_tp.ko cmd.ko tp_info.ko msm_drm.ko panel_event_notifier.ko qcom_va_minidump.ko hx83112f.ko ilitek.ko icnl9922c.ko"
TW_LOAD_VENDOR_MODULES_EXCLUDE_GKI := true
TW_LOAD_VENDOR_BOOT_MODULES := true

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/vendor.prop

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 100663296
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296

BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Dynamic partitions
BOARD_SUPER_PARTITION_SIZE := 9126805504
BOARD_SUPER_PARTITION_GROUPS := samsung_dynamic_partitions
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_PARTITION_LIST := system odm product system_ext vendor vendor_dlkm
BOARD_SAMSUNG_DYNAMIC_PARTITIONS_SIZE := 9122611200

BOARD_SYSTEMIMAGE_PARTITION_TYPE := ext4
BOARD_USERDATAIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_VENDORIMAGE_FILE_SYSTEM_TYPE := ext4
TARGET_COPY_OUT_VENDOR := vendor

# Encryption
BOARD_USES_METADATA_PARTITION := true

# Recovery
TARGET_RECOVERY_PIXEL_FORMAT := RGBX_8888
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/recovery/root/system/etc/recovery.fstab
RECOVERY_SDCARD_ON_DATA := true

# Use mke2fs to create ext4 images
TARGET_USES_MKE2FS := true

# TWRP Configuration
TW_THEME := portrait_hdpi
TW_H_OFFSET := -80
TW_Y_OFFSET := 80
TW_INCLUDE_NTFS_3G := true
TW_NO_REBOOT_BOOTLOADER := true
TW_BRIGHTNESS_PATH := /sys/class/backlight/panel0-backlight/brightness
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone0/temp
TW_EXTRA_LANGUAGES := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_USE_TOOLBOX := true
TW_EXCLUDE_APEX := true
TW_EXCLUDE_DEFAULT_USB_INIT := true
TW_NO_HAPTICS := true
TW_FRAMERATE := 90
TW_HAS_DOWNLOAD_MODE := true
TARGET_RECOVERY_QCOM_RTC_FIX := true

# Tool
TW_INCLUDE_REPACKTOOLS := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_INCLUDE_LPDUMP := true
TW_INCLUDE_LPTOOLS := true

# TWRP Debug Flags
TARGET_USES_LOGD := true
TWRP_INCLUDE_LOGCAT := true
TWRP_EVENT_LOGGING := true
