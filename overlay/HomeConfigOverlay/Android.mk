###############################################################################
# HomeConfigOverlay
LOCAL_PATH:= $(my-dir)

include $(CLEAR_VARS)
LOCAL_PACKAGE_NAME := HomeConfigOverlay
LOCAL_MODULE_OWNER := google
LOCAL_MODULE_TAGS := optional
LOCAL_PRODUCT_MODULE := true
LOCAL_CERTIFICATE := platform
LOCAL_RESOURCE_DIR := $(LOCAL_PATH)/res
LOCAL_SDK_VERSION := current
include $(BUILD_RRO_PACKAGE)
