$(call inherit-product, vendor/google/products/eea_go_common.mk)

GMS_PRODUCT_PACKAGES += \
    sysconfig_eea_v2_search_chrome \
    GmsConfigOverlayAssistantGo \
    AssistantGo \
    GoogleSearchGo \
    Chrome \
    SearchSelector \
    GmsEEAType4cIntegrationGo \
    Launcher3Go \
    GMailGo

# Add GMS package into system product packages
PRODUCT_PACKAGES += $(GMS_PRODUCT_PACKAGES)