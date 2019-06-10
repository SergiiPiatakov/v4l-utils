LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := v4l2-compliance
LOCAL_MODULE_TAGS := optional

LOCAL_CFLAGS += -DNO_LIBV4L2 -Wno-error

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../.. \
    $(LOCAL_PATH)/../common

LOCAL_SRC_FILES := \
    v4l2-compliance.cpp \
    v4l2-test-buffers.cpp \
    v4l2-test-codecs.cpp \
    v4l2-test-colors.cpp \
    v4l2-test-controls.cpp \
    v4l2-test-debug.cpp \
    v4l2-test-formats.cpp \
    v4l2-test-input-output.cpp \
    v4l2-test-io-config.cpp

include $(BUILD_EXECUTABLE)
