LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := v4l2-dbg
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += -Wno-error

LOCAL_C_INCLUDES := $(LOCAL_PATH)/../..

LOCAL_SRC_FILES := v4l2-dbg.cpp

include $(BUILD_EXECUTABLE)
