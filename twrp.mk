PRODUCT_COPY_FILES += \
    device/motorola/clark/recovery/root/etc/twrp.fstab:recovery/root/etc/twrp.fstab \
    vendor/motorola/clark/proprietary/lib64/hw/keystore.qcom.so:recovery/root/vendor/lib64/hw/keystore.qcom.so \
    vendor/motorola/clark/proprietary/vendor/lib64/libQSEEComAPI.so:recovery/root/vendor/lib64/libQSEEComAPI.so \
    vendor/motorola/clark/proprietary/vendor/lib64/libdiag.so:recovery/root/vendor/lib64/libdiag.so \
    vendor/motorola/clark/proprietary/vendor/lib64/libdrmfs.so:recovery/root/vendor/lib64/libdrmfs.so \
    vendor/motorola/clark/proprietary/vendor/lib64/libdrmtime.so:recovery/root/vendor/lib64/libdrmtime.so \
    vendor/motorola/clark/proprietary/vendor/lib64/librpmb.so:recovery/root/vendor/lib64/librpmb.so \
    vendor/motorola/clark/proprietary/vendor/lib64/libssd.so:recovery/root/vendor/lib64/libssd.so \
    vendor/motorola/clark/proprietary/vendor/lib64/libtime_genoff.so:recovery/root/vendor/lib64/libtime_genoff.so

RECOVERY_VARIANT := twrp

TW_INCLUDE_CRYPTO := true
TW_NEW_ION_HEAP := true
TW_SCREEN_BLANK_ON_BOOT := true
TW_THEME := portrait_hdpi
TARGET_CRYPTFS_HW_PATH += vendor/qcom/opensource/cryptfs_hw
TARGET_RECOVERY_QCOM_RTC_FIX := true
