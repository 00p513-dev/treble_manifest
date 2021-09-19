$(call inherit-product, vendor/partner_gms/products/eea_common.mk)

GMS_PRODUCT_PACKAGES += \
    sysconfig_eea_v1 \
    GoogleSpeechServices \
    GoogleActionsService \
    GmsEEAType1Integration \
    GmsConfigOverlayVAS \
    Launcher3QuickStep

# Add GMS package into system product packages
PRODUCT_PACKAGES += $(GMS_PRODUCT_PACKAGES)
