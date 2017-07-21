# Inherit 64-bit configs
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, device/motorola/clark/device.mk)

# Inherit some common COS stuff.
$(call inherit-product, vendor/cos/common.mk)

DEVICE_PACKAGE_OVERLAYS += device/motorola/clark/overlay

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cos_clark
PRODUCT_BRAND := Android
PRODUCT_DEVICE := clark
PRODUCT_MODEL := XT1575
PRODUCT_MANUFACTURER := motorola
PRODUCT_GMS_CLIENTID_BASE := android-motorola

# magisk
INCLUDE_MAGISK=true
