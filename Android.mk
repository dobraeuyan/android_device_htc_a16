LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),a16)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

KEYMASTER_IMAGES := \
    keymaste.b00 keymaste.b01 keymaste.b02 keymaste.b03 keymaste.mdt

KEYMASTER_SYMLINKS := $(addprefix $(TARGET_ROOT_OUT)/firmware/image/,$(notdir $(KEYMASTER_IMAGES)))
$(KEYMASTER_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Keymaster firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /etc/firmware/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(KEYMASTER_SYMLINKS)

MBA_IMAGES := \
    mba.b00 mba.b01 mba.b02 mba.b03 mba.b04 mba.b05 mba.mbn mba.mdt

MBA_SYMLINKS := $(addprefix $(TARGET_ROOT_OUT)/firmware/image/,$(notdir $(MBA_IMAGES)))
$(MBA_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "MBA firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/radio/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MBA_SYMLINKS)

MISC_IMAGES := \
    radiover.cfg version.cfg

MISC_SYMLINKS := $(addprefix $(TARGET_ROOT_OUT)/firmware/image/,$(notdir $(MISC_IMAGES)))
$(MISC_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Misc firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/radio/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MISC_SYMLINKS)

MODEM_IMAGES := \
    modem.b00 modem.b01 modem.b02 modem.b03 modem.b05 modem.b06 \
    modem.b07 modem.b08 modem.b09 modem.b10 modem.b11 modem.b12 \
    modem.b13 modem.b14 modem.b15 modem.b16 modem.b19 modem.b20 \
    modem.b21 modem.b22 modem.b23 modem.b24 modem.mdt

MODEM_SYMLINKS := $(addprefix $(TARGET_ROOT_OUT)/firmware/image/,$(notdir $(MODEM_IMAGES)))
$(MODEM_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Modem firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/radio/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(MODEM_SYMLINKS)

WCNSS_IMAGES := \
    wcnss.b00 wcnss.b01 wcnss.b02 wcnss.b03 wcnss.b04 wcnss.b05 wcnss.b06 \
    wcnss.b07 wcnss.b08 wcnss.b09 wcnss.b10 wcnss.b11 wcnss.b12 wcnss.mdt \
    wcnssver.cfg

WCNSS_SYMLINKS := $(addprefix $(TARGET_ROOT_OUT)/firmware/image/,$(notdir $(WCNSS_IMAGES)))
$(WCNSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/wcnss/$(notdir $@) $@

ALL_DEFAULT_INSTALLED_MODULES += $(WCNSS_SYMLINKS)

RFS_ADSP_SYMLINKS := $(TARGET_OUT)/rfs/msm/adsp
$(RFS_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_ADSP_SYMLINKS)

RFS_MPSS_SYMLINKS := $(TARGET_OUT)/rfs/msm/mpss
$(RFS_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /firmware/wsd $@/readonly/wsd
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/modem $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/mpss $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MPSS_SYMLINKS)

endif
