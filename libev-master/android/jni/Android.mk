LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := libev
include $(BUILD_STATIC_LIBRARY)

LOCAL_CFLAGS := -D_ANDROID_
LOCAL_LDLIBS+= -L$(SYSROOT)/usr/lib -llog

# 遍历目录及子目录的函数
define walk
    $(wildcard $(1)) $(foreach e, $(wildcard $(1)/*), $(call walk, $(e)))
endef

ALLFILES = $(call walk, $(LOCAL_PATH)/../.. \
FILE_LIST += $(filter %.c, $(ALLFILES))
LOCAL_SRC_FILES := $(FILE_LIST:$(LOCAL_PATH)/%=%)


FILE_INCLUDES := $(shell find $(LOCAL_PATH)/../.. -type d) \
LOCAL_C_INCLUDES := $(FILE_INCLUDES)
