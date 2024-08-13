LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),a16)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

RADIO_IMAGES := \
	modem.b00 modem.b01 modem.b02 modem.b03 modem.b05 modem.b06 \
	modem.b07 modem.b08 modem.b09 modem.b10 modem.b11 modem.b12 \
	modem.b13 modem.b14 modem.b15 modem.b16 modem.b19 modem.b20 \
	modem.b21 modem.b22 modem.b23 modem.b24 modem.mdt mba.b00 \
	mba.b01 mba.b02 mba.b03 mba.b04 mba.b05 mba.mbn mba.mdt

RADIO_SYMLINKS := $(addprefix $(TARGET_ROOT_OUT)/firmware/image/,$(notdir $(RADIO_IMAGES)))
$(RADIO_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Radio firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /firmware/radio/$(notdir $@) $@

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

KEYMASTER_IMAGES := \
	keymaste.mdt keymaste.b00 keymaste.b01 keymaste.b02 keymaste.b03

KEYMASTER_SYMLINKS := $(addprefix $(TARGET_ROOT_OUT)/firmware/image/,$(notdir $(KEYMASTER_IMAGES)))
$(KEYMASTER_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Keymaster firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/vendor/firmware/$(notdir $@) $@

WCNSS_CFG_INI := $(TARGET_OUT_ETC)/firmware/wlan/prima/WCNSS_qcom_cfg.ini
$(WCNSS_CFG_INI): $(LOCAL_INSTALLED_MODULE)
	@echo "WCNSS_qcom_cfg.ini Firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /data/misc/wifi/$(notdir $@) $@

RFS_ADSP_SYMLINKS := $(TARGET_OUT)/rfs/msm/adsp
$(RFS_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

RFS_APQ_GNSS_SYMLINKS := $(TARGET_OUT)/rfs/apq/gnss
$(RFS_APQ_GNSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

RFS_MDM_ADSP_SYMLINKS := $(TARGET_OUT)/rfs/mdm/adsp
$(RFS_MDM_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

RFS_MDM_MPSS_SYMLINKS := $(TARGET_OUT)/rfs/mdm/mpss
$(RFS_MDM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

RFS_MDM_SPARROW_SYMLINKS := $(TARGET_OUT)/rfs/mdm/sparrow
$(RFS_MDM_SPARROW_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

RFS_MPSS_SYMLINKS := $(TARGET_OUT)/rfs/msm/mpss
$(RFS_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /firmware/wsd $@/readonly/wsd
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/modem $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/mpss $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

ALL_DEFAULT_INSTALLED_MODULES += \
	$(RADIO_SYMLINKS) $(WCNSS_SYMLINKS) $(KEYMASTER_SYMLINKS) \
        $(RFS_ADSP_SYMLINKS) $(RFS_APQ_GNSS_SYMLINKS) $(WCNSS_CFG_INI) \
	$(RFS_MDM_ADSP_SYMLINKS) $(RFS_MDM_MPSS_SYMLINKS) \
	$(RFS_MDM_SPARROW_SYMLINKS) $(RFS_MPSS_SYMLINKS)
endif
