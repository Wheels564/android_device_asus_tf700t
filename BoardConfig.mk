#
# Copyright (C) 2011 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Audio
BOARD_USES_GENERIC_AUDIO := false
BOARD_HAVE_PRE_KITKAT_AUDIO_BLOB := true

# Camera
USE_CAMERA_STUB := false

# Inherit from the proprietary version
-include vendor/asus/tf700t/BoardConfigVendor.mk

TARGET_DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Board naming
TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := cardhu
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a9
ARCH_ARM_HAVE_TLS_REGISTER := true
ARCH_ARM_HAVE_32_BYTE_CACHE_LINES := true
ARCH_ARM_USE_NON_NEON_MEMCPY := true

# Boot/Recovery image settings
BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE :=

# EGL settings
USE_OPENGL_RENDERER := true
BOARD_HAVE_PIXEL_FORMAT_INFO := true

# Misc display settings
BOARD_USE_SKIA_LCDTEXT := true
BOARD_NO_ALLOW_DEQUEUE_CURRENT_BUFFER := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
BOARD_USES_LEGACY_SET_POSITION := true

# Acquire signature for WVM
BOARD_USES_LEGACY_ACQUIRE_WVM := true

# Bluetooth
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_BCM := true
BOARD_BLUEDROID_VENDOR_CONF := device/asus/tf700t/bluetooth/vnd_tf700t.txt
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR ?= device/asus/tf700t/bluetooth

# Support for dock battery
TARGET_HAS_DOCK_BATTERY := true

# Misc flags
COMMON_GLOBAL_CFLAGS += -DNEEDS_VECTORIMPL_SYMBOLS

# Wifi related defines
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE           := bcmdhd
WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_STA     := "/system/vendor/firmware/bcm4330/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_AP      := "/system/vendor/firmware/bcm4330/fw_bcmdhd_apsta.bin"
# WIFI_DRIVER_FW_PATH_P2P     := "/system/vendor/firmware/bcm4330/fw_bcmdhd_p2p.bin"

# Partitions
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 8388608
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368
BOARD_USERDATAIMAGE_PARTITION_SIZE := 29850022707
BOARD_FLASH_BLOCK_SIZE := 4096
# TARGET_USERIMAGES_SPARSE_EXT_DISABLED := true

# Build the kernel inline
TARGET_KERNEL_SOURCE := kernel/asus/tegra3
TARGET_KERNEL_CONFIG := omni_tf700t_defconfig
BOARD_KERNEL_IMAGE_NAME := zImage
KERNEL_TOOLCHAIN := "$(BUILD_TOP)/prebuilts/gcc/$(strip $(HOST_OS))-x86/arm/arm-eabi-4.7/bin/"

# Allow overriding partition for boot image
TARGET_RELEASETOOL_OTA_FROM_TARGET_ADDITIONAL_ARGS := --override_boot_partition=/staging

# SELinux Defines
BOARD_SEPOLICY_DIRS += \
    device/asus/tf700t/sepolicy

# Dynamic memory allocation
MALLOC_SVELTE := true

# Hardware tunables and properties
BOARD_HARDWARE_CLASS := device/asus/tf700t/cmhw/

# TWRP
TW_THEME := landscape_hdpi
BOARD_CUSTOM_BOOTIMG_MK := device/asus/tf700t/recovery/recovery.mk
TARGET_RECOVERY_FSTAB := device/asus/tf700t/ramdisk/fstab.cardhu
BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_HAS_SDCARD_INTERNAL := true
TARGET_USERIMAGES_USE_F2FS := true
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := true
TW_NO_REBOOT_RECOVERY := true
TW_INCLUDE_CRYPTO := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
