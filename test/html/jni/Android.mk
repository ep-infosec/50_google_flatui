# Copyright 2016 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)/..

FLATUI_DIR := $(LOCAL_PATH)/../..
include $(FLATUI_DIR)/jni/android_config.mk

include $(CLEAR_VARS)
LOCAL_MODULE := html_test
LOCAL_ARM_MODE := arm
LOCAL_SRC_FILES := \
  flatui_html_test.cpp \
  ../mocks/flatui_mocks.cpp \
  ../mocks/flatui_common_mocks.cpp \
  ../mocks/fplbase_mocks.cpp \
  $(FLATUI_DIR)/src/font_manager.cpp \
  $(FLATUI_DIR)/src/font_systemfont.cpp \
  $(FLATUI_DIR)/src/glyph_cache.cpp \
  $(FLATUI_DIR)/src/hb_complex_font.cpp \
  $(FLATUI_DIR)/src/micro_edit.cpp \
  $(FLATUI_DIR)/src/script_table.cpp \
  $(FLATUI_DIR)/src/version.cpp

LOCAL_C_INCLUDES := \
  $(FLATUI_DIR) \
  $(FLATUI_DIR)/include \
  $(FLATUI_DIR)/include/flatui \
  $(FLATUI_DIR)/test \
  $(FLATUI_DIR)/external/include/harfbuzz \
  $(FLATUI_GENERATED_OUTPUT_DIR) \
  $(DEPENDENCIES_FPLBASE_DIR)/gen/include \
  $(DEPENDENCIES_FREETYPE_DIR)/include \
  $(DEPENDENCIES_FPLBASE_DIR)/include \
  $(DEPENDENCIES_GUMBO_DIR)/src \
  $(DEPENDENCIES_HARFBUZZ_DIR)/src \
  $(DEPENDENCIES_LIBUNIBREAK_DIR)/src \
  $(DEPENDENCIES_STB_DIR)

LOCAL_WHOLE_STATIC_LIBRARIES := \
  android_native_app_glue \
  libfplutil \
  libfplutil_main \
  libfplutil_print

LOCAL_STATIC_LIBRARIES := \
  flatbuffers \
  libmathfu \
  libfreetype \
  libgtest \
  libgumbo-parser \
  libgmock \
  libharfbuzz \
  libunibreak

LOCAL_CFLAGS := $(FPL_CFLAGS)

include $(BUILD_SHARED_LIBRARY)

$(call import-add-path,$(FLATUI_DIR)/..)
$(call import-add-path,$(DEPENDENCIES_MATHFU_DIR)/..)
$(call import-add-path,$(DEPENDENCIES_FPLBASE_DIR)/..)
$(call import-add-path,$(DEPENDENCIES_FLATBUFFERS_DIR)/..)

$(call import-module, android/native_app_glue)
$(call import-module, flatbuffers/android/jni)
$(call import-module, flatui/jni)
$(call import-module, fplbase/jni)
$(call import-module, libfplutil/jni/libs/googletest)
$(call import-module, mathfu/jni)
