#
# Copyright 2014 The Android Open Source Project
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

# This contains the module build definitions for the hardware-specific
# components for this device.
#
# As much as possible, those components should be built unconditionally,
# with device-specific names to avoid collisions, to avoid device-specific
# bitrot and build breakages. Building a component unconditionally does
# *not* include it on all devices, so it is safe even with hardware-specific
# components.

LOCAL_PATH := $(call my-dir)

ifneq ($(filter clark, $(TARGET_DEVICE)),)
include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

PERSIST_WCNSS := $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/WCNSS_qcom_wlan_nv.bin
$(PERSIST_WCNSS): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS_qcom_wlan_factory_nv.bin Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /persist/$(notdir $@) $@

WCNSS_CFG_INI := $(TARGET_OUT_ETC)/firmware/wlan/qca_cld/WCNSS_qcom_cfg.ini
$(WCNSS_CFG_INI): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS_qcom_cfg.ini Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /data/misc/wifi/$(notdir $@) $@

IMS_LIBS := libimscamera_jni.so libimsmedia_jni.so
IMS_SYMLINKS := $(addprefix $(TARGET_OUT)/app/ims/lib/arm64/,$(notdir $(IMS_LIBS)))
$(IMS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "IMS lib link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/lib64/$(notdir $@) $@

WV_IMAGES := widevine.b00 widevine.b01 widevine.b02 widevine.b03 widevine.mdt
WV_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(WV_IMAGES)))
$(WV_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Widevine firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

FIRMWARE_FILES := firmware fsg
FIRMWARE_SYMLINKS := $(addprefix $(TARGET_OUT)/rfs/msm/mpss/readonly/,$(notdir $(FIRMWARE_FILES)))
$(FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(PERSIST_WCNSS) $(WCNSS_CFG_INI) $(IMS_SYMLINKS) $(WV_SYMLINKS) $(FIRMWARE_SYMLINKS)

endif
