###############################################################################
# GMS home folder location
# Note: we cannot use $(my-dir) in this makefile
ANDROID_PARTNER_GMS_HOME := vendor/google

$(call inherit-product, build/target/product/product_launched_with_p.mk)

# Android Build system uncompresses DEX files (classes*.dex) in the privileged
# apps by default, which breaks APK v2/v3 signature. Because some privileged
# GMS apps are still shipped with compressed DEX, we need to disable
# uncompression feature to make them work correctly.
# DONT_UNCOMPRESS_PRIV_APPS_DEXS := true

# GMS mandatory core packages
GMS_PRODUCT_PACKAGES += \
    AndroidPlatformServices \
    ConfigUpdater \
    GoogleExtShared \
    GoogleFeedback \
    GoogleLocationHistory \
    GoogleOneTimeInitializer \
    GooglePackageInstaller \
    GooglePartnerSetup \
    GooglePrintRecommendationService \
    GoogleRestore \
    GoogleServicesFramework \
    GoogleSpeechServices \
    GoogleCalendarSyncAdapter \
    GoogleContactsSyncAdapter \
    GoogleTTS \
    GmsCoreGo \
    Phonesky \
    SetupWizard \
    WebViewGoogle \
    Wellbeing

# GMS common RRO packages
GMS_PRODUCT_PACKAGES += GmsConfigOverlayCommon GmsConfigOverlayGo GmsConfigOverlayAssistantGo

# GMS common configuration files
GMS_PRODUCT_PACKAGES += \
    play_store_fsi_cert \
    default_permissions_allowlist_google \
    privapp_permissions_google_system \
    privapp_permissions_google_product \
    privapp_permissions_google_system_ext \
    split_permissions_google \
    preferred_apps_google_go \
    sysconfig_wellbeing \
    google_hiddenapi_package_allowlist \
    sysconfig_gmsexpress

# Workaround for b/138542583
PRODUCT_COPY_FILES += $(ANDROID_PARTNER_GMS_HOME)/etc/sysconfig/google_go.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google.xml

# Overlay for GMS devices: default backup transport in SettingsProvider
PRODUCT_PACKAGE_OVERLAYS += $(ANDROID_PARTNER_GMS_HOME)/overlay/gms_overlay

# GMS mandatory application packages
GMS_PRODUCT_PACKAGES += \
    AssistantGo \
    Chrome \
    DuoGo \
    GalleryGo \
    GMailGo \
    GoogleSearchGo \
    LatinImeGoogleGo \
    MapsGo \
    NavGo \
    YouTube

# GMS comms suite
$(call inherit-product, $(ANDROID_PARTNER_GMS_HOME)/products/google_go_comms_suite.mk)

# GMS optional application packages
GMS_PRODUCT_PACKAGES += \
    CalendarGoogle \
    GoogleContacts \
    FilesGoogle

# GMS sample application packages
GMS_PRODUCT_PACKAGES += \
    GmsSampleIntegrationGo

# Add GMS package into system product packages
PRODUCT_PACKAGES += $(GMS_PRODUCT_PACKAGES)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.boot.vendor.overlay.theme=com.android.internal.systemui.navbar.threebutton

# Add acsa property for CarrierServices
PRODUCT_PRODUCT_PROPERTIES += \
    ro.com.google.acsa=true

# Disable deferred SUW for go as needed
PRODUCT_PRODUCT_PROPERTIES += \
    setupwizard.feature.deferred_setup_low_ram_filter=true

PRODUCT_PRODUCT_PROPERTIES += \
    ro.setupwizard.rotation_locked=true \
    setupwizard.theme=glif_v3_light \
    setupwizard.feature.checkin_timeout_enabled=false \
    ro.opa.eligible_device=true \
    ro.com.google.gmsversion=11_202108.go
