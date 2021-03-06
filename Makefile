THEOS_PACKAGE_DIR_NAME = debs
TARGET = iphone:clang:latest:7.0
ARCHS = armv7 armv7s arm64

include theos/makefiles/common.mk

TWEAK_NAME = SleepyAlarm
SleepyAlarm_FILES = SleepyAlarm.xm RMPickerViewController/RMPickerViewController.m
SleepyAlarm_FRAMEWORKS = UIKit CoreGraphics
SleepyAlarm_LIBRARIES = cephei
SleepyAlarm_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += SleepyAlarmPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk

internal-after-install::
	install.exec "killall -9 MobileTimer; killall -9 Preferences"