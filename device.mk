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

PRODUCT_COPY_FILES += \
    device/moto/clark/fstab.qcom:root/fstab.qcom \
    device/moto/clark/twrp.fstab:recovery/root/etc/twrp.fstab

PRODUCT_COPY_FILES += \
    device/moto/clark/rootdir/init.class_main.sh:root/init.class_main.sh \
    device/moto/clark/rootdir/init.mdm.sh:root/init.mdm.sh \
    device/moto/clark/rootdir/init.mmi.block_perm.sh:root/init.mmi.block_perm.sh \
    device/moto/clark/rootdir/init.mmi.boot.sh:root/init.mmi.boot.sh \
    device/moto/clark/rootdir/init.mmi.debug.rc:root/init.mmi.debug.rc \
    device/moto/clark/rootdir/init.mmi.diag.rc:root/init.mmi.diag.rc \
    device/moto/clark/rootdir/init.mmi.diag_mdlog.rc:root/init.mmi.diag_mdlog.rc \
    device/moto/clark/rootdir/init.mmi.early_boot.sh:root/init.mmi.early_boot.sh \
    device/moto/clark/rootdir/init.mmi.rc:root/init.mmi.rc \
    device/moto/clark/rootdir/init.mmi.touch.sh:root/init.mmi.touch.sh \
    device/moto/clark/rootdir/init.mmi.usb.rc:root/init.mmi.usb.rc \
    device/moto/clark/rootdir/init.mmi.usb.sh:root/init.mmi.usb.sh \
    device/moto/clark/rootdir/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
    device/moto/clark/rootdir/init.qcom.early_boot.sh:root/init.qcom.early_boot.sh \
    device/moto/clark/rootdir/init.qcom.rc:root/init.qcom.rc \
    device/moto/clark/rootdir/init.qcom.sh:root/init.qcom.sh \
    device/moto/clark/rootdir/init.qcom.syspart_fixup.sh:root/init.qcom.syspart_fixup.sh \
    device/moto/clark/rootdir/init.target.rc:root/init.target.rc \
    device/moto/clark/rootdir/module_hashes:root/module_hashes \
    device/moto/clark/rootdir/ueventd.qcom.rc:root/ueventd.qcom.rc \
    device/moto/clark/rootdir/etc/init.ath3k.bt.sh:system/etc/init.ath3k.bt.sh \
    device/moto/clark/rootdir/etc/init.crda.sh:system/etc/init.crda.sh \
    device/moto/clark/rootdir/etc/init.qcom.audio.sh:system/etc/init.qcom.audio.sh \
    device/moto/clark/rootdir/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
    device/moto/clark/rootdir/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
    device/moto/clark/rootdir/etc/init.qcom.debug.sh:system/etc/init.qcom.debug.sh \
    device/moto/clark/rootdir/etc/init.qcom.efs.sync.sh:system/etc/init.qcom.efs.sync.sh \
    device/moto/clark/rootdir/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
    device/moto/clark/rootdir/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
    device/moto/clark/rootdir/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
    device/moto/clark/rootdir/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh \
    device/moto/clark/rootdir/etc/init.wifi.mac.sh:system/etc/init.wifi.mac.sh

PRODUCT_COPY_FILES += \
    device/moto/clark/sec_config:system/etc/sec_config

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
    device/moto/clark/configs/wifi/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
    device/moto/clark/configs/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/moto/clark/configs/wifi/WCNSS_qcom_cfg.ini:system/etc/wifi/WCNSS_qcom_cfg.ini

PRODUCT_COPY_FILES += \
    device/moto/clark/configs/sensors/sensorhub-blacklist.txt:system/etc/firmware/sensorhub-blacklist.txt

PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.barometer.xml:system/etc/permissions/android.hardware.sensor.barometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml

PRODUCT_COPY_FILES += \
    device/moto/clark/mixer_paths.xml:system/etc/mixer_paths.xml

# NFC access control + feature files + configuration
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml

PRODUCT_PACKAGES += atmel.fw.apq8084

PRODUCT_TAGS += dalvik.gc.type-precise

# This device is 560dpi.  However the platform doesn't
# currently contain all of the bitmaps at 560dpi density so
# we do this little trick to fall back to the xxhdpi version
# if the 560dpi doesn't exist.
PRODUCT_AAPT_CONFIG := normal hdpi xhdpi xxhdpi 560dpi xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := 560dpi

PRODUCT_CHARACTERISTICS := nosdcard

DEVICE_PACKAGE_OVERLAYS := \
    device/moto/clark/overlay

PRODUCT_PACKAGES := \
    wifi_symlinks \
    libwpa_client \
    hostapd \
    wpa_supplicant

PRODUCT_PACKAGES += \
    libcnefeatureconfig \
    libqsap_sdk \
    libxml2

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni

PRODUCT_PACKAGES += \
    gralloc.msm8992 \
    hwcomposer.msm8992 \
    copybit.msm8992 \
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
    ro.sf.lcd_density=560

PRODUCT_PROPERTY_OVERRIDES += \
    persist.hwc.mdpcomp.enable=true

PRODUCT_PROPERTY_OVERRIDES += \
    persist.audio.calfile0=/etc/acdbdata/Bluetooth_cal.acdb \
    persist.audio.calfile1=/etc/acdbdata/General_cal.acdb \
    persist.audio.calfile2=/etc/acdbdata/Global_cal.acdb \
    persist.audio.calfile3=/etc/acdbdata/Handset_cal.acdb \
    persist.audio.calfile4=/etc/acdbdata/Hdmi_cal.acdb \
    persist.audio.calfile5=/etc/acdbdata/Headset_cal.acdb \
    persist.audio.calfile6=/etc/acdbdata/Speaker_cal.acdb \
    persist.audio.dualmic.config=endfire \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.voicecomm=true \
    persist.audio.fluence.voicecall=true \
    persist.audio.fluence.speaker=true \
    audio.offload.gapless.enabled=true

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/vendor/lib64/libril-qc-qmi-1.so \
    rild.libargs=-d /dev/smd0 \
    ril.subscription.types=NV,RUIM \
    ril.subscription.types=RUIM \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.radio.no_wait_for_card=1 \
    persist.radio.mode_pref_nv10=1 \
    persist.radio.force_get_pref=1

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

$(call inherit-product-if-exists, hardware/qcom/msm8x84/msm8x84.mk)
$(call inherit-product-if-exists, vendor/qcom/gpu/msm8x84/msm8x84-gpu-vendor.mk)
