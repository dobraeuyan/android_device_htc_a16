DEVICE_PATH := device/htc/a16

TARGET_SPECIFIC_HEADER_PATH := $(DEVICE_PATH)/include

BOARD_SECCOMP_POLICY := $(DEVICE_PATH)/seccomp

# ANT+
BOARD_ANT_WIRELESS_DEVICE := "vfs-prerelease"

# Arch
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_ABI  := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_VARIANT := cortex-a7

BOARD_VENDOR := htc

# Audio
#USE_XML_AUDIO_POLICY_CONF := 1
BOARD_USES_ALSA_AUDIO := true
BOARD_SUPPORTS_SOUND_TRIGGER := false
TARGET_ENABLE_QC_AV_ENHANCEMENTS := true

# Bionic
TARGET_LD_SHIM_LIBS := \
    /system/lib/libcamera_client.so.so|/system/lib/libshim_camera.so \
    /system/lib/liblog.so|/system/lib/liblog_htc.so

# Bluetooth
#BOARD_HAVE_BLUETOOTH := true
#BOARD_HAVE_BLUETOOTH_QCOM := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Board
TARGET_BOARD_PLATFORM := msm8909
TARGET_BOARD_PLATFORM_GPU := qcom-adreno304

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := MSM8909
TARGET_NO_BOOTLOADER := true

# Camera
TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_parameters_ext
TARGET_HAS_LEGACY_CAMERA_HAL1 := true
USE_DEVICE_SPECIFIC_CAMERA := true

# Cryptfs_hw
TARGET_CRYPTFS_HW_PATH := vendor/qcom/opensource/cryptfs_hw

# Dexpreopt
#ifeq ($(HOST_OS),linux)
#  ifeq ($(TARGET_BUILD_VARIANT),userdebug)
#    WITH_DEXPREOPT := true
#    DEX_PREOPT_DEFAULT := nostripping
#  endif
#endif

# Display
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_HARDWARE_3D := false
TARGET_HAVE_HDMI_OUT := false
TARGET_USES_C2D_COMPOSITION := false
TARGET_USES_ION := true
TARGET_USES_NEW_ION_API :=true
TARGET_USES_QCOM_BSP := true
TARGET_USES_PCI_RCS := false
TARGET_CONTINUOUS_SPLASH_ENABLED := true
USE_OPENGL_RENDERER := true

GET_FRAMEBUFFER_FORMAT_FROM_HWC := true

MAX_EGL_CACHE_KEY_SIZE := 12*1024
MAX_EGL_CACHE_SIZE := 2048*1024

OVERRIDE_RS_DRIVER := libRSDriver_adreno.so

# EGL
BOARD_EGL_CFG := $(DEVICE_PATH)/configs/egl.cfg

#Encryption
TARGET_HW_DISK_ENCRYPTION := true
TARGET_HW_KEYMASTER_V03 := true

#FM Radio
TARGET_QCOM_NO_FM_FIRMWARE := true
BOARD_HAVE_QCOM_FM := true
AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true

# Filesystem
BOARD_FLASH_BLOCK_SIZE := 131072
BOARD_BOOTIMAGE_PARTITION_SIZE := 33554432
BOARD_CACHEIMAGE_PARTITION_SIZE := 234881024
BOARD_PERSISTIMAGE_PARTITION_SIZE := 524288
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 34603008
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3500146688
BOARD_USERDATAIMAGE_PARTITION_SIZE := 10849598976

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4

# Hardware
#BOARD_HARDWARE_CLASS += hardware/cyanogen/cmhw
#BOARD_USES_CYANOGEN_HARDWARE := true

# IMS
TARGET_USES_IMS := true

# Init
TARGET_RECOVERY_DEVICE_MODULES := libinit_msm8909
TARGET_INIT_VENDOR_LIB := libinit_msm8909
TARGET_PLATFORM_DEVICE_BASE := /devices/soc.0/

# Kernel
TARGET_COMPILE_WITH_MSM_KERNEL := true
TARGET_KERNEL_SOURCE := kernel/htc/a16
TARGET_KERNEL_CONFIG := lineage_a16_defconfig

BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01e00000
BOARD_RAMDISK_OFFSET := 0x02000000
BOARD_MKBOOTIMG_ARGS :=  --ramdisk_offset $(BOARD_RAMDISK_OFFSET) --tags_offset $(BOARD_KERNEL_TAGS_OFFSET) --dt $(DEVICE_PATH)/dt.img --board boot:0
BOARD_KERNEL_CMDLINE := console=ttyHSL0,115200,n8 androidboot.console=ttyHSL0 androidboot.hardware=qcom ehci-hcd.park=3 androidboot.bootdevice=7824900.sdhci lpm_levels.sleep_disabled=1 vmalloc=400m  androidboot.selinux=permissive
BOARD_NAME := boot:0

# Keymaster
TARGET_PROVIDES_KEYMASTER := true

# Lights
TARGET_PROVIDES_LIBLIGHT := true

# Media
TARGET_USES_MEDIA_EXTENSIONS := true

# Memory Config
MALLOC_SVELTE := true

# NFC
BOARD_NFC_CHIPSET := pn548

# Peripheral manager
TARGET_PER_MGR_ENABLED := true

# Power
TARGET_POWERHAL_VARIANT := qcom

# Properties
TARGET_SYSTEM_PROP += $(DEVICE_PATH)/system.prop

# Protobuf
PROTOBUF_SUPPORTED := false

# Qualcomm
BOARD_USES_QCOM_HARDWARE := true
#BOARD_USES_QC_TIME_SERVICES := true

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/recovery.fstab

# RIL
#TARGET_RIL_VARIANT := caf
#BOARD_PROVIDES_LIBRIL := true

# SELinux
include device/qcom/sepolicy/sepolicy.mk
    
#BOARD_SEPOLICY_DIRS += \
#    $(DEVICE_PATH)/sepolicy
    
# Sensors
USE_SENSOR_MULTI_HAL := true

# Widevine
BOARD_WIDEVINE_OEMCRYPTO_LEVEL := 3

# Wifi
WPA_SUPPLICANT_VERSION      := VER_0_8_X
BOARD_HAS_QCOM_WLAN         := true
BOARD_HAS_QCOM_WLAN_SDK     := true
BOARD_WLAN_DEVICE           := qcwcn
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
BOARD_HOSTAPD_DRIVER        := NL80211
BOARD_HOSTAPD_PRIVATE_LIB   := lib_driver_cmd_$(BOARD_WLAN_DEVICE)
TARGET_PROVIDES_WCNSS_QMI   := true
TARGET_USES_WCNSS_CTRL      := true
TARGET_USES_QCOM_WCNSS_QMI  := true
WIFI_DRIVER_FW_PATH_AP      := "ap"
WIFI_DRIVER_FW_PATH_STA     := "sta"

# OTA
TARGET_OTA_ASSERT_DEVICE := a16,16uhl,a16whl,a16wl,a16ul,htc_a16uhl,htc_a16whl,htc_a16wl,htc_a16ul

# inherit from the proprietary version
-include vendor/htc/a16/BoardConfigVendor.mk
