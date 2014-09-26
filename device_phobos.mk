$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/hp/phobos/phobos-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/hp/phobos/overlay

LOCAL_PATH := device/hp/phobos
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

#PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel \
    device/hp/phobos/fstab.dalmore:root/fstab.dalmore \
    device/hp/phobos/ueventd.dalmore.rc:root/ueventd.dalmore.rc

PRODUCT_COPY_FILES += \
    device/hp/phobos/fstab.dalmore:root/fstab.dalmore \
    device/hp/phobos/ueventd.dalmore.rc:root/ueventd.dalmore.rc

$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0 \
				 PRODUCT_MANUFACTURER=Hewlett-Packard \
				 PRODUCT_MODEL="Slate 21"

#PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
				 
PRODUCT_NAME := full_phobos
PRODUCT_DEVICE := phobos