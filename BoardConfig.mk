# Copyright (C) 2013 The Android Open Source Project
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
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

# WARNING: This line must come *before* including the proprietary
# variant, so that it gets overwritten by the parent (which goes
# against the traditional rules of inheritance).

# inherit from common m7-common
-include device/htc/t6-common/BoardConfigCommon.mk

# Assert
TARGET_OTA_ASSERT_DEVICE := t6whl,t6spr

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := t6whl

# Filesystem
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16776704
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 2550136832
BOARD_USERDATAIMAGE_PARTITION_SIZE := 26843545600
BOARD_FLASH_BLOCK_SIZE := 131072

# RIL
BOARD_PROVIDES_LIBRIL := true

# dev:        size     erasesize name
# mmcblk0p21: 000ffa00 00000200 "misc"
# mmcblk0p38: 00fffe00 00000200 "recovery"
# mmcblk0p37: 01000000 00000200 "boot"
# mmcblk0p39: 98000000 00000200 "system"
# mmcblk0p28: 00140200 00000200 "local"
# mmcblk0p41: 3ffffe00 00000200 "cache"
# mmcblk0p42: 640000000 00000200 "userdata"
# mmcblk0p24: 01400000 00000200 "devlog"
# mmcblk0p26: 00040000 00000200 "pdata"
# mmcblk0p29: 00010000 00000200 "extra"
# mmcblk0p34: 05000000 00000200 "radio"
# mmcblk0p16: 03c00400 00000200 "adsp"
# mmcblk0p15: 00100000 00000200 "dsps"
# mmcblk0p18: 00500000 00000200 "wcnss"
# mmcblk0p17: 007ffa00 00000200 "radio_config"
# mmcblk0p22: 00400000 00000200 "modem_st1"
# mmcblk0p23: 00400000 00000200 "modem_st2"
# mmcblk0p31: 00040000 00000200 "skylink"
# mmcblk0p32: 01900000 00000200 "carrier"
# mmcblk0p30: 00100000 00000200 "cdma_record"
# mmcblk0p20: 016ffc00 00000200 "reserve_1"
# mmcblk0p35: 02fffc00 00000200 "reserve_2"
# mmcblk0p36: 05fffc00 00000200 "reserve_3"
# mmcblk0p40: 03fffa00 00000200 "reserve_4"
# mmcblk0p33: 04729a00 00000200 "reserve"

# inherit from the proprietary version
-include vendor/htc/t6-common/BoardConfigVendor.mk

# Custom recovery
TARGET_PREBUILT_KERNEL := device/htc/t6/kernel
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
TARGET_RECOVERY_INITRC := device/htc/t6spr/init.rc
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true

# TWRP
DEVICE_RESOLUTION := 1080x1920
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "usb-otg"
TW_NO_USB_STORAGE := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
HAVE_SELINUX := true

#MultiROM config. MultiROM also uses parts of TWRP config
MR_INPUT_TYPE := type_b
MR_INIT_DEVICES := device/htc/t6spr/mr_init_devices.c
MR_DPI := xxhdpi
MR_FSTAB := device/htc/t6spr/twrp.fstab
MR_USE_MROM_FSTAB := true
MR_DEVICE_HOOKS := device/htc/t6spr/mr_hooks.c
MR_DEVICE_HOOKS_VER := 1
MR_KEXEC_MEM_MIN := 0x85000000
