###############################################################################
# Only use this makefile for the Google Fi devices
$(call inherit-product, vendor/google/products/gms.mk)

# GCS and Tycho apps are mandatory for Google Fi.
GMS_PRODUCT_PACKAGES += \
    Tycho \
    GCS \
    NovaBugreportWrapper \
    GmsConfigOverlayFi \
    sysconfig_google_fi \
    privapp_permissions_google_fi

# Add GMS package into system product packages
PRODUCT_PACKAGES += $(GMS_PRODUCT_PACKAGES)
