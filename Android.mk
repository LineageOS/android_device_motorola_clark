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

WV_IMAGES := widevine.b00 widevine.b01 widevine.b02 widevine.b03 widevine.mdt
WV_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(WV_IMAGES)))
$(WV_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Widevine firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/image/$(notdir $@) $@

DMENGINE_FILES := libdmengine.so libdmjavaplugin.so
DMENGINE_SYMLINKS := $(addprefix $(TARGET_OUT)/priv-app/DMService/lib/arm/,$(notdir $(DMENGINE_FILES)))
$(DMENGINE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "DMEngine link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/lib/$(notdir $@) $@

BT_FIRMWARE := btfw32.tlv btnv32.bin btfw30.tlv btnv30.bin
BT_FIRMWARE_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/firmware/,$(notdir $(BT_FIRMWARE)))
$(BT_FIRMWARE_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating BT firmware symlink: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /bt_firmware/image/$(notdir $@) $@

RFS_MSM_ADSP_SYMLINKS := $(TARGET_OUT)/rfs/msm/adsp/
$(RFS_MSM_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM ADSP folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

RFS_MSM_MPSS_SYMLINKS := $(TARGET_OUT)/rfs/msm/mpss/
$(RFS_MSM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MSM MPSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/modem $@/ramdumps
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /fsg $@/readonly/fsg
	$(hide) ln -sf /persist/rfs/msm/mpss $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

RFS_MDM_ADSP_SYMLINKS := $(TARGET_OUT)/rfs/mdm/adsp/
$(RFS_MDM_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MDM ADSP folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/modem $@/ramdumps
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/rfs/mdm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

RFS_MDM_MPSS_SYMLINKS := $(TARGET_OUT)/rfs/mdm/mpss/
$(RFS_MDM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MDM MPSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/modem $@/ramdumps
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/rfs/mdm/mpss $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

RFS_MDM_SPARROW_SYMLINKS := $(TARGET_OUT)/rfs/mdm/sparrow/
$(RFS_MDM_SPARROW_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS MDM SPARROW folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/sparrow $@/ramdumps
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/rfs/mdm/sparrow $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

RFS_APQ_GNSS_SYMLINKS := $(TARGET_OUT)/rfs/apq/gnss/
$(RFS_APQ_GNSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Creating RFS APQ GNSS folder structure: $@"
	@rm -rf $@/*
	@mkdir -p $(dir $@)/readonly
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/modem $@/ramdumps
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/rfs/apq/gnss $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

ALL_DEFAULT_INSTALLED_MODULES += $(PERSIST_WCNSS) $(WCNSS_CFG_INI) $(WV_SYMLINKS) $(FIRMWARE_SYMLINKS) $(DMENGINE_SYMLINKS) $(BT_FIRMWARE_SYMLINKS) $(RFS_MSM_ADSP_SYMLINKS) $(RFS_MSM_MPSS_SYMLINKS) $(RFS_MDM_ADSP_SYMLINKS) $(RFS_MDM_MPSS_SYMLINKS) $(RFS_MDM_SPARROW_SYMLINKS) $(RFS_APQ_GNSS_SYMLINKS)

endif
