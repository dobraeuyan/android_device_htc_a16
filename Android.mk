LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),a16)

include $(call all-subdir-makefiles,$(LOCAL_PATH))

endif
