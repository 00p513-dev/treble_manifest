$(call inherit-product, vendor/partner_gms/products/eea_go_common.mk)

GMS_PRODUCT_PACKAGES += \
    sysconfig_eea_v2_search_chrome \
    GmsConfigOverlayAssistantGo \
    AssistantGo \
    GoogleSearchGo \
    Chrome \
    SearchSelector \
    GmsEEAType4cIntegrationGo_2GB \
    Launcher3Go \
    Drive \
    Videos \
    YTMusic \
    Gmail2

# Add GMS package into system product packages
PRODUCT_PACKAGES += $(GMS_PRODUCT_PACKAGES)