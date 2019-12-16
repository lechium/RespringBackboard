target = appletv:12.1
THEOS_DEVICE_IP = guest-room.local
DEBUG=0
include $(THEOS)/makefiles/common.mk
INSTALL_TARGET_PROCESSES = TVSystemMenuService 

BUNDLE_NAME = RestartBackboard

RestartBackboard_FILES = KBRBModule.m
RestartBackboard_INSTALL_PATH = /Library/TVSystemMenuModules
RestartBackboard_FRAMEWORKS = UIKit
RestartBackboard_PRIVATE_FRAMEWORKS = TVSystemMenuUI PineBoardServices
RestartBackboard_CFLAGS = -fobjc-arc  -F. -I.
RestartBackboard_LDFLAGS +=  -F. -I.
RestartBackboard_CODESIGN_FLAGS=-Sent.plist

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/TVSystemMenuModules$(ECHO_END)
	
after-install::
	install.exec "killall -9 TVSystemMenuService"
