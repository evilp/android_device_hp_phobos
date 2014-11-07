# Copyright (C) 2011 The Android Open Source Project
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

#$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# inherit common language setup
#$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

# inherit phobos vendor setup
$(call inherit-product-if-exists, vendor/hp/phobos/phobos-vendor.mk)

# path to overlay files
DEVICE_PACKAGE_OVERLAYS += device/hp/phobos/overlay

LOCAL_PATH := device/hp/phobos
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

# prebuild kernel
#PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \

# twrp
PRODUCT_COPY_FILES += \
	device/hp/phobos/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/fstab.dalmore:root/fstab.dalmore \
	$(LOCAL_PATH)/ueventd.dalmore.rc:root/ueventd.dalmore.rc

# build characteristics setting
PRODUCT_CHARACTERISTICS := tablet

# build.prob
PRODUCT_BUILD_PROP_OVERRIDES += \
	BUILD_UTC_DATE=0 \
	PRODUCT_MANUFACTURER=Hewlett-Packard \
	PRODUCT_MODEL="Slate 21"

# specific properties
PRODUCT_PROPERTY_OVERRIDES := \
	persist.sys.usb.config=mtp,adb

# device Naming
PRODUCT_NAME	:= full_phobos
PRODUCT_DEVICE	:= phobos
PRODUCT_BRAND	:= hp
PRODUCT_MODEL	:= Slate 21
