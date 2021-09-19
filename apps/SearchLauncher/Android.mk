LOCAL_PATH := $(call my-dir)
###############################################################################
# Prebuilt Launcher client library
# It supports -1 screen by integrating Google search app with a launcher
#
include $(CLEAR_VARS)

LOCAL_MODULE := lib_launcherClient
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := JAVA_LIBRARIES
LOCAL_SRC_FILES := libs/launcher_client.jar
LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := 28

include $(BUILD_PREBUILT)
#
###############################################################################
# Search Launcher (QSB on the top)
#
include $(CLEAR_VARS)

LOCAL_USE_AAPT2 := true
LOCAL_AAPT2_ONLY := true

# Relative path for AOSP Launcher3 directory
LAUNCHER_PATH := ../../../../packages/apps/Launcher3

LOCAL_STATIC_ANDROID_LIBRARIES := Launcher3CommonDepsLib
LOCAL_STATIC_JAVA_LIBRARIES := lib_launcherClient

LOCAL_SRC_FILES := \
    $(call all-java-files-under, $(LAUNCHER_PATH)/src_shortcuts_overrides) \
    $(call all-java-files-under, $(LAUNCHER_PATH)/src_ui_overrides) \
    $(call all-java-files-under, src) \
    $(call all-java-files-under, src_base) \
    $(call all-java-files-under, $(LAUNCHER_PATH)/src)

LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res

LOCAL_PROGUARD_ENABLED := disabled
LOCAL_PRIVATE_PLATFORM_APIS := true

LOCAL_PACKAGE_NAME := SearchLauncher
LOCAL_MODULE_TAGS := optional
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_PRIVILEGED_MODULE := true
LOCAL_OVERRIDES_PACKAGES := Home Launcher2 Launcher3 Launcher3QuickStep
LOCAL_REQUIRED_MODULES := privapp_whitelist_com.android.launcher3 GmsConfigOverlaySearchLauncher
LOCAL_FULL_LIBS_MANIFEST_FILES := $(LOCAL_PATH)/$(LAUNCHER_PATH)/AndroidManifest-common.xml
LOCAL_JACK_COVERAGE_INCLUDE_FILTER := com.android.launcher3.*

include $(BUILD_PACKAGE)
#
###############################################################################
# Search Launcher QuickStep
#
include $(CLEAR_VARS)

LOCAL_USE_AAPT2 := true
LOCAL_AAPT2_ONLY := true

# Relative path for AOSP Launcher3 directory
LAUNCHER_PATH := ../../../../packages/apps/Launcher3

LOCAL_STATIC_ANDROID_LIBRARIES := Launcher3CommonDepsLib
LOCAL_STATIC_JAVA_LIBRARIES := \
    launcherprotosnano \
    lib_launcherClient \
    SystemUISharedLib \
    SystemUI-statsd

LOCAL_SRC_FILES := \
    $(call all-java-files-under, quickstep/src) \
    $(call all-java-files-under, $(LAUNCHER_PATH)/quickstep/src) \
    $(call all-java-files-under, $(LAUNCHER_PATH)/src_shortcuts_overrides) \
    $(call all-java-files-under, src) \
    $(call all-java-files-under, $(LAUNCHER_PATH)/src) \
    $(call all-java-files-under, $(LAUNCHER_PATH)/quickstep/recents_ui_overrides/src)

LOCAL_RESOURCE_DIR := \
    $(LOCAL_PATH)/quickstep/res \
    $(LOCAL_PATH)/res \
    $(LOCAL_PATH)/$(LAUNCHER_PATH)/quickstep/res \
    $(LOCAL_PATH)/$(LAUNCHER_PATH)/quickstep/recents_ui_overrides/res

LOCAL_PROGUARD_ENABLED := disabled
LOCAL_PRIVATE_PLATFORM_APIS := true

LOCAL_PACKAGE_NAME := SearchLauncherQuickStep
LOCAL_MODULE_TAGS := optional
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_PRIVILEGED_MODULE := true
LOCAL_OVERRIDES_PACKAGES := Home Launcher2 Launcher3 Launcher3QuickStep
LOCAL_REQUIRED_MODULES := privapp_whitelist_com.android.launcher3 GmsConfigOverlaySearchLauncherQuickStep
LOCAL_FULL_LIBS_MANIFEST_FILES := $(LOCAL_PATH)/$(LAUNCHER_PATH)/quickstep/AndroidManifest.xml
LOCAL_JACK_COVERAGE_INCLUDE_FILTER := com.android.launcher3.*

include $(BUILD_PACKAGE)
#
###############################################################################
include $(call all-makefiles-under,$(LOCAL_PATH))
