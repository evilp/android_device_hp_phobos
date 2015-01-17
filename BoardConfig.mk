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

DEVICE_PACKAGE_OVERLAYS += device/hp/phobos/overlay

# This variable is set first, so it can be overridden
# by BoardConfigVendor.mk
USE_CAMERA_STUB := false
BOARD_USES_GENERIC_AUDIO := false

# inherit from the proprietary version
-include vendor/hp/phobos/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := tegra
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a15
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_USE_QCOM_BIONIC_OPTIMIZATION := true

TARGET_NO_RADIOIMAGE := true
TARGET_BOOTLOADER_BOARD_NAME := dalmore

# Kernel
#BOARD_KERNEL_CMDLINE := androidboot.selinux=permissive 
BOARD_KERNEL_CMDLINE := 
BOARD_KERNEL_BASE := 0x10000000
BOARD_KERNEL_PAGESIZE := 2048

# Try to build the kernel
#TARGET_KERNEL_SOURCE := kernel/hp/phobos
#TARGET_KERNEL_CONFIG := cyanogenmod_phobos_defconfig
# fallback to prebuild kernel
TARGET_PREBUILT_KERNEL := device/hp/phobos/kernel

# Video
BOARD_EGL_CFG := device/hp/phobos/egl.cfg
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

BOARD_USE_SKIA_LCDTEXT := true

# Partition
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 8388608 # 8M
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216 # 16M
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 805306368 # 768M
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5385486336 # 5G
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_CACHEIMAGE_PARTITION_SIZE := 1073741824 # 1G

# Recovery
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_HAS_LARGE_FILESYSTEM := true
#TARGET_RECOVERY_INITRC := device/hp/phobos/recovery/init.rc
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_23x41.h\"
RECOVERY_FSTAB_VERSION := 2
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/backlight/pwm-backlight/brightness\"
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD

# Wifi related defines
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_bcmdhd
BOARD_WLAN_DEVICE := bcmdhd

WIFI_DRIVER_FW_PATH_PARAM   := "/sys/module/bcmdhd/parameters/firmware_path"
WIFI_DRIVER_FW_PATH_AP      := "/vendor/firmware/bcm43341/fw_bcmdhd_apsta.bin"
WIFI_DRIVER_FW_PATH_STA     := "/vendor/firmware/bcm43341/fw_bcmdhd.bin"
WIFI_DRIVER_FW_PATH_P2P     := "/vendor/firmware/bcm43341/fw_bcmdhd_p2p.bin"


# SELINUX Defines
BOARD_SEPOLICY_DIRS := \
    device/hp/phobos/sepolicy

BOARD_SEPOLICY_UNION := \
    file_contexts \
    genfs_contexts \
    app.te \
    bdaddwriter.te \
    device.te \
    drmserver.te \
    init_shell.te \
    file.te \
    sensors_config.te \
    system.te \
    zygote.te \
    healthd.te \
    domain.te \
    ueventd.te
    
#twrp
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
DEVICE_RESOLUTION := 1920x1080
RECOVERY_SDCARD_ON_DATA := true
BOARD_HAS_NO_REAL_SDCARD := true
TW_NO_USB_STORAGE := true
TW_NO_REBOOT_BOOTLOADER := false
TW_NO_REBOOT_RECOVERY := false
TW_NO_BATT_PERCENT := true
#TW_NO_CPU_TEMP := true
TW_CUSTOM_CPU_TEMP_PATH := /sys/class/thermal/thermal_zone3/temp
#TW_INCLUDE_BLOBPACK := true
TW_HAS_MTP := true

#TW_INCLUDE_DUMLOCK := true
TW_INTERNAL_STORAGE_PATH := "/data/media"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sdcard"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sdcard"
#TWRP_EVENT_LOGGING := true

#TW_INCLUDE_CRYPTO := true
#TW_CRYPTO_FS_TYPE := "ext4"
#TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/sdhci-tegra.3/by-name/UDA"
#TW_CRYPTO_MNT_POINT := "/data"
#TW_CRYPTO_FS_OPTIONS := "data=ordered,delalloc"
#TW_CRYPTO_FS_FLAGS := "0x00000406"
#TW_CRYPTO_KEY_LOC := "footer"

#TWHAVE_SELINUX := true

TW_BRIGHTNESS_FILE := /sys/class/backlight/pwm-backlight/brightness
TW_MAX_BRIGHTNESS := 255