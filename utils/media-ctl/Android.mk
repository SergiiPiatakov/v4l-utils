LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := media-ctl
LOCAL_MODULE_TAGS := optional
LOCAL_MODULE_CLASS := EXECUTABLES

LOCAL_CFLAGS += -DNO_LIBV4L2 -Wno-error

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/../.. \
    $(LOCAL_PATH)/../common


PRIVATE_INPUT_FILE := $(LOCAL_PATH)/../../include/linux/media-bus-format.h

GEN_FORMAT_NAMES := $(local-generated-sources-dir)/media-bus-format-names.h
$(GEN_FORMAT_NAMES): PRIVATE_CUSTOM_TOOL = \
	sed -e '/\#define MEDIA_BUS_FMT/ ! d' \
		-e 's/.*FMT_//' \
		-e'/FIXED/ d' \
		-e 's/\t.*//' \
		-e 's/.*/{ \"&\", MEDIA_BUS_FMT_& },/' \
		< $< > $@
$(GEN_FORMAT_NAMES): $(PRIVATE_INPUT_FILE)
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN_FORMAT_NAMES)

GEN_FORMAT_CODES := $(local-generated-sources-dir)/media-bus-format-codes.h
$(GEN_FORMAT_CODES): PRIVATE_CUSTOM_TOOL = cp $(PRIVATE_INPUT_FILE) $@
$(GEN_FORMAT_CODES): PRIVATE_CUSTOM_TOOL = \
	sed -e '/\#define MEDIA_BUS_FMT/ ! d' \
		-e 's/.*\#define //' \
		-e '/FIXED/ d' \
		-e 's/\t.*//' \
		-e 's/.*/ &,/' \
		< $< > $@
$(GEN_FORMAT_CODES): $(PRIVATE_INPUT_FILE)
	$(transform-generated-source)
LOCAL_GENERATED_SOURCES += $(GEN_FORMAT_CODES)


LOCAL_SRC_FILES := \
    media-ctl.c \
    options.c \
    libmediactl.c \
    libv4l2subdev.c

include $(BUILD_EXECUTABLE)
