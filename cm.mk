# Boot animation
TARGET_SCREEN_HEIGHT := 1440
TARGET_SCREEN_WIDTH := 2560

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Enhanced NFC
$(call inherit-product, vendor/cm/config/nfc_enhanced.mk)

# Inherit device configuration
$(call inherit-product, device/moto/clark/aosp_clark.mk)

DEVICE_PACKAGE_OVERLAYS += device/moto/clark/overlay

## Device identifier. This must come after all inclusions
PRODUCT_NAME := cm_clark
PRODUCT_BRAND := Android
PRODUCT_MODEL := XT1575

PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=motorola/clark_retus/clark:5.1.1/LPH23.116-18/18:user/release-keys \
    PRIVATE_BUILD_DESC="clark_retus-user 5.1.1 LPH23.116-18 18 release-keys"
