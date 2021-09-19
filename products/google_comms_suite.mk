PRODUCT_PACKAGE_OVERLAYS += vendor/partner_gms/overlay/gms_overlay_comms
GMS_PRODUCT_PACKAGES += \
    privapp_permissions_google_comms_suite \
    CarrierServices \
    GoogleContacts \
    GmsConfigOverlayComms

ifneq ($(strip $(MTK_TB_WIFI_3G_MODE)),WIFI_ONLY)
GMS_PRODUCT_PACKAGES += \
    GoogleDialer \
    Messages
endif

# Add GMS package into system product packages
PRODUCT_PACKAGES += $(GMS_PRODUCT_PACKAGES)