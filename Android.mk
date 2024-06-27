LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),a16)

include $(call all-makefiles-under,$(LOCAL_PATH))

include $(CLEAR_VARS)

ETC_IMAGES := \
    tbase.b00 tbase.b01 tbase.b02 tbase.b03 tbase.mdt               
    
    #a225p5_pm4.fw a225_pfp.fw a225_pm4.fw a300_pfp.fw a300_pm4.fw \
    #a330_pfp.fw a330_pm4.fw a420_pfp.fw a420_pm4.fw alIAF_InData_4M2M \
    #cmnlib.b00 cmnlib.b01 cmnlib.b02 cmnlib.b03 cmnlib.mdt cpp_firmware_v1_1_1.fw \
    #cpp_firmware_v1_1_6.fw cpp_firmware_v1_2_0.fw cpp_firmware_v1_4_0.fw \
    #htc_drmprov.b00 htc_drmprov.b01 htc_drmprov.b02 htc_drmprov.b03 \
    #htc_drmprov.mdt ILP0100_IPM_Code_out.bin ILP0100_IPM_Data_out.bin \
    #leia_pfp_470.fw leia_pm4_470.fw lscbuffer_rev2.bin nfc_test.bin \
    #Signedrompatch_v20.bin Signedrompatch_v21.bin Signedrompatch_v24.bin \
    #Signedrompatch_v30.bin  \
    #venus.b00 venus.b01 venus.b02 venus.b03 venus.b04 venus.mbn venus.mdt \
    #widevine.b00 widevine.b01 widevine.b02 widevine.b03 widevine.mdt
    

ETC_SYMLINKS := $(addprefix $(TARGET_ROOT_OUT)/firmware/image/,$(notdir $(ETC_IMAGES)))
$(ETC_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@echo "Etc firmware link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system/etc/firmware/$(notdir $@) $@

RADIO_IMAGES := \
    modem.b00 modem.b01 modem.b02 modem.b03 modem.b05 modem.b06 \
    modem.b07 modem.b08 modem.b09 modem.b10 modem.b11 modem.b12 \
    modem.b13 modem.b14 modem.b15 modem.b16 modem.b19 modem.b20 \
    modem.b21 modem.b22 modem.b23 modem.b24 modem.mdt mba.b00 \
    mba.b01 mba.b02 mba.b03 mba.b04 mba.b05 mba.mbn mba.mdt radiover.cfg

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

ALL_DEFAULT_INSTALLED_MODULES += $(RADIO_SYMLINKS) $(WCNSS_SYMLINKS) $(KEYMASTER_SYMLINKS) $(ETC_SYMLINKS)

RFS_ADSP_SYMLINKS := $(TARGET_OUT)/rfs/msm/adsp
$(RFS_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_ADSP_SYMLINKS)

RFS_APQ_GNSS_SYMLINKS := $(TARGET_OUT)/rfs/apq/gnss
$(RFS_APQ_GNSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_APQ_GNSS_SYMLINKS)

RFS_MDM_ADSP_SYMLINKS := $(TARGET_OUT)/rfs/mdm/adsp
$(RFS_MDM_ADSP_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MDM_ADSP_SYMLINKS)

RFS_MDM_MPSS_SYMLINKS := $(TARGET_OUT)/rfs/mdm/mpss
$(RFS_MDM_MPSS_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MDM_MPSS_SYMLINKS)

RFS_MDM_SPARROW_SYMLINKS := $(TARGET_OUT)/rfs/mdm/sparrow
$(RFS_MDM_SPARROW_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	@mkdir -p $@/readonly
	$(hide) ln -sf /firmware $@/readonly/firmware
	$(hide) ln -sf /persist/hlos_rfs/shared $@/hlos
	$(hide) ln -sf /data/tombstones/lpass $@/ramdumps
	$(hide) ln -sf /persist/rfs/msm/adsp $@/readwrite
	$(hide) ln -sf /persist/rfs/shared $@/shared

ALL_DEFAULT_INSTALLED_MODULES += $(RFS_MDM_SPARROW_SYMLINKS)

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

# Create a link for the WCNSS config file, which ends up as a writable
# version in /data/misc/wifi
#WCNSS_CONFIG := WCNSS_qcom_cfg.ini

#WCNSS_CONFIG_SYMLINK := $(addprefix $(TARGET_OUT_ETC)/wifi/,$(notdir $(WCNSS_CONFIG)))
#$(WCNSS_CONFIG_SYMLINK): $(LOCAL_INSTALLED_MODULE)
#	@echo "WCNSS config link: $@"
#	@mkdir -p $(dir $@)
#	@rm -rf $@
#	$(hide) ln -sf /data/misc/wifi/$(notdir $@) $@
#
#ALL_DEFAULT_INSTALLED_MODULES += $(WCNSS_CONFIG_SYMLINK)

endif
