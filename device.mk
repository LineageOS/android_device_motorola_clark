#
# Copyright (C) 2014 The Android Open-Source Project
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

# This file includes all definitions that apply to ALL clark devices, and
# are also specific to clark devices
#
# Everything in this directory will become public

LOCAL_KERNEL := device/moto/clark/kernel

PRODUCT_COPY_FILES := \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/moto/clark/init.clark.rc:root/init.clark.rc \
    device/moto/clark/init.clark.usb.rc:root/init.clark.usb.rc \
    device/moto/clark/fstab.qcom:root/fstab.qcom \
    device/moto/clark/twrp.fstab:recovery/root/etc/twrp.fstab \
    device/moto/clark/ueventd.clark.rc:root/ueventd.clark.rc

# Input device files for clark
PRODUCT_COPY_FILES += \
    device/moto/clark/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

PRODUCT_COPY_FILES += \
    device/moto/clark/audio_policy.conf:system/etc/audio_policy.conf \
    device/moto/clark/audio_effects.conf:system/etc/audio_effects.conf

PRODUCT_COPY_FILES += \
    device/moto/clark/media_profiles.xml:system/etc/media_profiles.xml \
    device/moto/clark/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
    device/moto/clark/mixer_paths.xml:system/etc/mixer_paths.xml

PRODUCT_PACKAGES += atmel.fw.apq8084

PRODUCT_TAGS += dalvik.gc.type-precise

# This device is xhdpi.  However the platform doesn't
# currently contain all of the bitmaps at xhdpi density so
# we do this little trick to fall back to the hdpi version
# if the xhdpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

PRODUCT_CHARACTERISTICS := nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/moto/clark/overlay

PRODUCT_PACKAGES := \
    libwpa_client \
    hostapd \
    wpa_supplicant \
    wpa_supplicant.conf

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni

PRODUCT_PACKAGES += \
    gralloc.msm8992 \
    hwcomposer.msm8992 \
    memtrack.msm8992 \
    libqdutils \
    libqdMetaData

PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libstagefrighthw \
    libOmxCore \
    libmm-omxcore \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc

PRODUCT_PACKAGES += \
    audio.primary.msm8992 \
    audio.a2dp.default \
    audio.usb.default \
    audio.r_submix.default \
    libaudio-resampler

# Audio effects
PRODUCT_PACKAGES += \
    libqcomvisualizer \
    libqcomvoiceprocessing \
    libqcomvoiceprocessingdescriptors

PRODUCT_PACKAGES += \
    libqomx_core \
    libmmcamera_interface \
    libmmjpeg_interface \
    camera.clark \
    mm-jpeg-interface-test \
    mm-qcamera-app

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck

# for off charging mode
PRODUCT_PACKAGES += \
    charger_res_images

PRODUCT_PACKAGES += \
    bdAddrLoader

PRODUCT_PROPERTY_OVERRIDES += \
    ro.opengles.version=196608

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=480

PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.mdpcomp.enable=true

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product-if-exists, hardware/qcom/msm8x84/msm8x84.mk)
$(call inherit-product-if-exists, vendor/qcom/gpu/msm8x84/msm8x84-gpu-vendor.mk)
