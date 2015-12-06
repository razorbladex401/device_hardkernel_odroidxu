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

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/hardkernel/odroidxu/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

include $(LOCAL_PATH)/BoardConfig.mk

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/conf/vold.fstab.sdboot:system/etc/vold.fstab.sdboot \
	$(LOCAL_PATH)/conf/vold.fstab.emmcboot:system/etc/vold.fstab.emmcboot \
	device/hardkernel/odroidxu/conf/init.odroidxu.rc:root/init.odroidxu.rc \
	device/hardkernel/odroidxu/conf/init.odroidxu.usb.rc:root/init.odroidxu.usb.rc 

# Init files
PRODUCT_COPY_FILES += \
	device/hardkernel/odroidxu/conf/fstab.odroidxu:root/fstab.odroidxu

PRODUCT_COPY_FILES += \
	device/hardkernel/odroidxu/conf/ueventd.odroidxu.rc:root/ueventd.odroidxu.rc

# Generated kcm keymaps
PRODUCT_PACKAGES := \
	odroid-keypad.kcm

PRODUCT_PACKAGES += \
	Superuser \
	su	

# Filesystem management tools
PRODUCT_PACKAGES += \
	make_ext4fs \
	setup_fs

# audio
PRODUCT_PACKAGES += \
	audio_policy.$(TARGET_BOOTLOADER_BOARD_NAME) \
	audio.primary.$(TARGET_BOOTLOADER_BOARD_NAME) \
	audio.a2dp.default \
	audio.usb.default \
	libaudioutils

# Camera
PRODUCT_PACKAGES += \
	camera.$(TARGET_BOOTLOADER_BOARD_NAME)

# Libs
PRODUCT_PACKAGES += \
	com.android.future.usb.accessory

# Video Editor
PRODUCT_PACKAGES += \
	VideoEditorGoogle

# Misc other modules
PRODUCT_PACKAGES += \
	lights.odroidxu

# gps
PRODUCT_PACKAGES += \
	gps.odroidxu

# OpenMAX IL configuration files
PRODUCT_COPY_FILES += \
	device/hardkernel/odroidxu/media_profiles.xml:system/etc/media_profiles.xml \
	device/hardkernel/odroidxu/media_codecs.xml:system/etc/media_codecs.xml

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml

# Bluetooth config file
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.nonsmartphone.conf:system/etc/bluetooth/main.conf \

# HardKernel
PRODUCT_PACKAGES += \
	OdroidUpdater \
	Utility

#
# Modules
#
PRODUCT_COPY_FILES += \
	device/hardkernel/odroidxu/modules/smsc95xx.ko:system/lib/modules/smsc95xx.ko \
	device/hardkernel/odroidxu/modules/rtl8192cu.ko:system/lib/modules/rtl8192cu.ko

PRODUCT_PROPERTY_OVERRIDES += \
	wifi.interface=wlan0 \
	wifi.supplicant_scan_interval=15
		
## Not the prettiest hack ever, but it'll do until JPlayer is understood
PRODUCT_COPY_FILES += \
    device/hardkernel/odroidxu/conf/98netflix:system/etc/init.d/98netflix

PRODUCT_PROPERTY_OVERRIDES := \
	ro.opengles.version=131072 \
	ro.sf.lcd_density=160
    ro.carrier=wifi-only

# Set default USB interface
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mass_storage

PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/tablet_core_hardware.xml:system/etc/permissions/tablet_core_hardware.xml \

PRODUCT_CHARACTERISTICS := tablet

PRODUCT_AAPT_CONFIG := xlarge hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

# setup dalvik vm configs.
$(call inherit-product, frameworks/native/build/tablet-10in-xhdpi-2048-dalvik-heap.mk)


PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product-if-exists, hardware/samsung_slsi/exynos5/exynos5.mk)
$(call inherit-product-if-exists, vendor/hardkernel/odroidxu/odroidxu-vendor.mk)
