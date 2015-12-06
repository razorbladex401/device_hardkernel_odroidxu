#
# Copyright (C) 2011 The Android Open-Source Project
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

# These two variables are set first, so they can be overridden
# by BoardConfigVendor.mk
BOARD_USES_GENERIC_AUDIO := false
BOARD_USES_I2S_AUDIO := true
BOARD_USES_PCM_AUDIO := false
BOARD_USES_SPDIF_AUDIO := false

TARGET_BOARD_INFO_FILE := device/hardkernel/odroidxu/board-info.txt

TARGET_SOC := exynos5410

TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_CPU_SMP := true
TARGET_CPU_VARIANT := cortex-a15
TARGET_ARCH := arm
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_ARCH_VARIANT_CPU := cortex-a15
ARCH_ARM_HAVE_TLS_REGISTER := true

TARGET_NO_BOOTLOADER := true
TARGET_NO_KERNEL := true
TARGET_NO_RADIOIMAGE := true
TARGET_BOARD_PLATFORM := exynos5
TARGET_BOOTLOADER_BOARD_NAME := odroidxu

# bionic libc options
ARCH_ARM_USE_MEMCPY_ALIGNMENT := true
BOARD_MEMCPY_ALIGNMENT := 64
BOARD_MEMCPY_ALIGN_BOUND := 32768

BOARD_EGL_CFG := device/hardkernel/odroidxu/conf/egl.cfg

# egl cache size : 256 * 1024
MAX_EGL_CACHE_SIZE := 262144

BOARD_USES_HGL := true
USE_OPENGL_RENDERER := true
NUM_FRAMEBUFFER_SURFACE_BUFFERS := 3

BOARD_USES_WQXGA_LCD := false

# Storage options
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1073741824
BOARD_USERDATAIMAGE_PARTITION_SIZE := 2147483648
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 4096
BOARD_MOUNT_SDCARD_RW := true

# Support RSC on PVR
BOARD_USES_PVR_RSC := true

# HACK : to fixup build
WPA_SUPPLICANT_VERSION := VER_0_8_X

# Audio
BOARD_USE_ALP_AUDIO := false
BOARD_USE_HDMI_AUDIO_ALWAYS := true

# Samsung OpenMAX Video
BOARD_USE_STOREMETADATA := true
BOARD_USE_METADATABUFFERTYPE := true
BOARD_USE_S3D_SUPPORT := true
BOARD_USE_DMA_BUF := true
BOARD_USE_ANB_OUTBUF_SHARE := true
BOARD_USE_GSC_RGB_ENCODER := true
BOARD_USE_IMPROVED_BUFFER := true
BOARD_USE_CSC_HW := false
BOARD_USE_H264_PREPEND_SPS_PPS := false
BOARD_USE_QOS_CTRL := false

# FIMG2D
BOARD_USES_SKIA_FIMGAPI := true
BOARD_USES_NEON_BLITANTIH := true

#G3D
#[HACK] Currently, SGX supports only HAL_PIXEL_FORMAT_BGRA_8888.
BOARD_USE_BGRA_8888 := true

# [HACK] It will be removed after updating s3c-fb driver.
BOARD_USE_WAIT_DEQUEUE_FENCE := false

# [HACK] It will be removed after implementing FENCE SYNC.
BOARD_USE_FENCE_SYNC := true

# CAMERA
BOARD_BACK_CAMERA_ROTATION := 270
BOARD_FRONT_CAMERA_ROTATION := 90
BOARD_USE_MHB_ION := true

#SurfaceFlinger
BOARD_USES_SYNC_MODE_FOR_MEDIA := true

# HWCServices
BOARD_USES_HWC_SERVICES := true
BOARD_USES_PRESENTATION_SUBTITLES := true
BOARD_USES_CEC := true

# HDMI
BOARD_USES_GSC_VIDEO := true

# FIMD
BOARD_USES_FB_PHY_LINEAR := false

# GPS
BOARD_HAVE_ODROID_GPS := true
BOARD_SUPPORT_EXTERNAL_GPS := true

#
# Wifi related defines
#
# realtek = rtl8192cu(WEXT/NL80211), r8712u(WEXT)
#
BOARD_WIFI_VENDOR	:= realtek
BOARD_WLAN_DEVICE	:= rtl8192cu

# drivers/net/wireless/rtl8191su
WIFI_DRIVER_MODULE_NAME             := "rtl8192cu"
WIFI_DRIVER_MODULE_PATH             := "/system/lib/modules/rtl8192cu.ko"

WPA_SUPPLICANT_VERSION              := VER_0_8_X
BOARD_WPA_SUPPLICANT_DRIVER         := WEXT
BOARD_WPA_SUPPLICANT_PRIVATE_LIB    := lib_driver_cmd_rtl

#WPA_SUPPLICANT_VERSION              := VER_0_8_X
#BOARD_WPA_SUPPLICANT_DRIVER         := NL80211
#BOARD_WPA_SUPPLICANT_PRIVATE_LIB    := lib_driver_cmd_rtl
#BOARD_HOSTAPD_DRIVER                := NL80211
#BOARD_HOSTAPD_PRIVATE_LIB           := lib_driver_cmd_rtl
#
# Realtek driver has FW embedded inside, and will automatically load FW
# at NIC initialization process. So there is no need to set these 
# 5 variables.
WIFI_DRIVER_MODULE_ARG           := ""
WIFI_FIRMWARE_LOADER             := ""
WIFI_DRIVER_FW_PATH_STA          := ""
WIFI_DRIVER_FW_PATH_AP           := ""
WIFI_DRIVER_FW_PATH_P2P          := ""
WIFI_DRIVER_FW_PATH_PARAM        := ""

#
# Bluetooth
#
BOARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_USB := true
# BOARD_HAVE_BLUETOOTH_CSR := true
# BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/generic/common/bluetooth
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
# BOARD_BLUETOOTH_USES_HCIATTACH_PROPERTY := true

BOARD_HAVE_ODROID_GPS := true
BOARD_SUPPORT_EXTERNAL_GPS := true
