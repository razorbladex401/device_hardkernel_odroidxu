
ot animation
TARGET_SCREEN_HEIGHT := 720
TARGET_SCREEN_WIDTH := 1280

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_tablet_wifionly.mk)

# Inherit device configuration
$(call inherit-product, device/hardkernel/odroidxu/odroidxu.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := odroidxu
PRODUCT_NAME := cm_odroidxu
PRODUCT_BRAND := Hardkernel
PRODUCT_MODEL := ODROID-XU
PRODUCT_MANUFACTURER := Hardkernel

