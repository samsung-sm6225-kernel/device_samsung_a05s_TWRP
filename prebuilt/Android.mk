LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)
    LOCAL_MODULE := samsung_prebuilt
    LOCAL_MODULE_TAGS := optional
    LOCAL_MODULE_CLASS := ETC
    LOCAL_MODULE_PATH := $(TARGET_RECOVERY_ROOT_OUT)
    LOCAL_POST_INSTALL_CMD += \
        mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/lib; \
        cp -rf $(LOCAL_PATH)/$(PRODUCT_RELEASE_NAME)/lib $(TARGET_RECOVERY_ROOT_OUT)/; \
        mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/vendor; \
        cp -rf $(LOCAL_PATH)/$(PRODUCT_RELEASE_NAME)/vendor $(TARGET_RECOVERY_ROOT_OUT)/; \
        mkdir -p $(TARGET_RECOVERY_ROOT_OUT)/vendor/firmware; \
        cp -rf $(LOCAL_PATH)/$(PRODUCT_RELEASE_NAME)/vendor/firmware $(TARGET_RECOVERY_ROOT_OUT)/vendor/;
include $(BUILD_PHONY_PACKAGE)
