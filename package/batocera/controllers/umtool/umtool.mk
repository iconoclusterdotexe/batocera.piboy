################################################################################
#
# umtool
#
################################################################################
# Version: Commits on Jun 13, 2022
UMTOOL_VERSION = 20b8c56a3e6f94034b8529eddd777306f5b6152b
UMTOOL_SITE = $(call github,katie-snow,Ultimarc-linux,$(UMTOOL_VERSION))
UMTOOL_LICENSE = GPLv2
UMTOOL_DEPENDENCIES = json-c libusb libtool udev
UMTOOL_CONF_OPTS = --disable-shared
UMTOOL_AUTORECONF = YES

define UMTOOL_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/src/umtool/umtool $(TARGET_DIR)/usr/bin/umtool

	# out-of-the-box configs
	mkdir -p $(TARGET_DIR)/usr/share/umtool
	cp $(@D)/src/umtool/*.json $(TARGET_DIR)/usr/share/umtool

	# udev rule
	cp $(@D)/21-ultimarc.rules $(TARGET_DIR)/etc/udev/rules.d/99-umtool.rules
endef

$(eval $(autotools-package))