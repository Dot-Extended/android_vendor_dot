# Copyright (C) 2018 Project Dot-Extended
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#Dot Versioning :
DOT_MOD_VERSION = v3.3


ifndef DOT_BUILD_TYPE
    DOT_BUILD_TYPE := UNOFFICIAL
endif

CURRENT_DEVICE=$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3)
CUSTOM_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)
	
PRODUCT_GENERIC_PROPERTIES += \
    dot.updater.uri=https://raw.githubusercontent.com/Dot-Extended/ota_config/pie/$(shell echo "$(TARGET_PRODUCT)" | cut -d'_' -f 2,3).json

TARGET_PRODUCT_SHORT := $(subst dot_,,$(CUSTOM_BUILD))

DOT_VERSION := Dot-Extended-P-$(DOT_MOD_VERSION)-$(CURRENT_DEVICE)-$(DOT_BUILD_TYPE)-$(CUSTOM_BUILD_DATE)

DOT_FINGERPRINT := Dot-Extended/$(DOT_MOD_VERSION)/$(PLATFORM_VERSION)/$(TARGET_PRODUCT_SHORT)/$(CUSTOM_BUILD_DATE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.dot.version=$(DOT_VERSION) \
  ro.dot.releasetype=$(DOT_BUILD_TYPE) \
  ro.modversion=$(DOT_MOD_VERSION)

DOT_DISPLAY_VERSION := Dot-Extended-$(DOT_MOD_VERSION)-$(DOT_BUILD_TYPE)

PRODUCT_GENERIC_PROPERTIES += \
  ro.dot.display.version=$(DOT_DISPLAY_VERSION)\
  ro.dot.fingerprint=$(DOT_FINGERPRINT)
