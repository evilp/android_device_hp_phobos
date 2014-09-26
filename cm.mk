## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := phobos

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/hp/phobos/device_phobos.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := phobos
PRODUCT_NAME := cm_phobos
PRODUCT_BRAND := hp
PRODUCT_MODEL := phobos
PRODUCT_MANUFACTURER := hp
