# Use lazy HAL implementations
PRODUCT_PACKAGES += \
    android.hardware.cas@1.2-service-lazy \
    android.hardware.drm@1.0-service-lazy \
    android.hardware.drm@1.3-service-lazy.clearkey \
    android.hardware.light@2.0-service-lazy \
    android.hardware.wifi@1.0-service-lazy \
    vendor.google.wifi_ext@1.0-service-vendor-lazy \

PRODUCT_PACKAGES += \
    android.hardware.camera.provider@2.4-service-lazy_64 \
    android.hardware.drm@1.3-service-lazy.widevine

PRODUCT_PROPERTY_OVERRIDES += \
    ro.camera.enableLazyHal=true \
