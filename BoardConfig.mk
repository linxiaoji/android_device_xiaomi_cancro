USE_CAMERA_STUB := true

COMMON_PATH := device/xiaomi/cancro

# inherit from the proprietary version
-include vendor/xiaomi/cancro/BoardConfigVendor.mk

TARGET_ARCH := arm
TARGET_NO_BOOTLOADER := true
TARGET_BOARD_PLATFORM := unknown
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_CPU_VARIANT := generic

TARGET_BOOTLOADER_BOARD_NAME := cancro

BOARD_KERNEL_SEPARATED_DT := true
BOARD_CUSTOM_BOOTIMG_MK   := $(COMMON_PATH)/mkbootimg.mk

BOARD_KERNEL_CMDLINE := ttyHSL0,115200,n8 androidboot.hardware=qcom user_debug=31 msm_rtb.filter=0x37 ehci-hcd.park=3
BOARD_KERNEL_BASE        := 0x00000000
BOARD_KERNEL_PAGESIZE    := 2048
BOARD_KERNEL_TAGS_OFFSET := 0x01E00000
BOARD_RAMDISK_OFFSET     := 0x02000000

# fix this up by examining /proc/mtd on a running device
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x105c0000
BOARD_FLASH_BLOCK_SIZE := 131072

TARGET_PREBUILT_KERNEL := $(COMMON_PATH)/kernel

# Recovery
TARGET_RECOVERY_FSTAB            := $(COMMON_PATH)/rootdir/ramdisk/fstab.qcom
RECOVERY_FSTAB_VERSION           := 2
USE_CHINESE_RECOVERY := true
TARGET_RECOVERY_PIXEL_FORMAT := "RGBX_8888"
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"

//USE_CHINESE_RECOVERY := true << Blame this
ifneq ($(USE_CHINESE_RECOVERY),true)
BOARD_USE_CUSTOM_RECOVERY_FONT   := \"roboto_15x24.h\"
BOARD_CUSTOM_RECOVERY_UI         := \
	../../$(COMMON_PATH)/recovery/dualboot.c \
	../../$(COMMON_PATH)/recovery/recovery_ui.c
else
BOARD_USE_CUSTOM_RECOVERY_FONT   := \"fontcn46_28x73.h\"
BOARD_CUSTOM_RECOVERY_UI         := \
	../../$(COMMON_PATH)/recovery/dualboot_cn.c \
	../../$(COMMON_PATH)/recovery/recovery_ui_cn.c
endif
USE_CHINESE_RECOVERY:= false
BOARD_RECOVERY_SWIPE := true
BOARD_HAS_NO_SELECT_BUTTON := true
