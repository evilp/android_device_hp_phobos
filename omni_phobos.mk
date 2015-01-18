#
# Copyright (C) 2013 OmniROM Project
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

# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_minimal.mk)

# Inherit from our custom product configuration
#$(call inherit-product, vendor/omni/config/common_tablet.mk)

# Inherit from those products. Most specific first.
$(call inherit-product, device/hp/phobos/device_phobos.mk)

# Discard inherited values and use our own instead.
PRODUCT_NAME := omni_phobos
PRODUCT_DEVICE := phobos
PRODUCT_BRAND := hp
PRODUCT_MANUFACTURER := Hewlett-Packard
PRODUCT_MODEL := "Slate 21"
