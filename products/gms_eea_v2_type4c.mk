$(call inherit-product, vendor/google/products/eea_common.mk)

GMS_PRODUCT_PACKAGES += \
    sysconfig_eea_v2_search_chrome \
    GmsConfigOverlayGSA \
    Velvet \
    Chrome \
    SearchSelector \
    GmsEEAType4cIntegration \
    SearchLauncherQuickStep

# Add GMS package into system product packages
PRODUCT_PACKAGES += $(GMS_PRODUCT_PACKAGES)