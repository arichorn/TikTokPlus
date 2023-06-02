TARGET = iphone:clang:15.5:14.0
TikTokPlus_USE_FISHHOOK = 0
ARCHS = arm64
MODULES = jailed
FINALPACKAGE = 1
CODESIGN_IPA = 0
PACKAGE_VERSION = 29.7.0-1.0

TWEAK_NAME = TikTokPlus
DISPLAY_NAME = TikTok
BUNDLE_ID = com.zhiliaoapp.musically

EXTRA_CFLAGS := $(addprefix -I,$(shell find Tweaks/FLEX -name '*.h' -exec dirname {} \;))

TikTokPlus_INJECT_DYLIBS =
TikTokPlus_FILES = Tweak.xm $(shell find Source -name '*.xm' -o -name '*.x' -o -name '*.m') $(shell find Tweaks/FLEX -type f \( -iname \*.c -o -iname \*.m -o -iname \*.mm \))
TikTokPlus_IPA = ./tmp/Payload/YouTube.app
TikTokPlus_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unsupported-availability-guard -Wno-unused-but-set-variable -DTWEAK_VERSION=$(PACKAGE_VERSION) $(EXTRA_CFLAGS)
TikTokPlus_FRAMEWORKS = UIKit Security

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS +=
include $(THEOS_MAKE_PATH)/aggregate.mk

before-package::
