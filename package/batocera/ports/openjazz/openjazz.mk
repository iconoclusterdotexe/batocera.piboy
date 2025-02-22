################################################################################
#
# openjazz
#
################################################################################
# Version: Commits on Nov 17, 2023
OPENJAZZ_VERSION = 63ce92a78c6e0914e9d99ff5bcf19b6b63bce19f
OPENJAZZ_SITE =  $(call github,AlisterT,openjazz,$(OPENJAZZ_VERSION))

OPENJAZZ_DEPENDENCIES = sdl2 sdl2_net
OPENJAZZ_LICENSE = GPLv2

OPENJAZZ_CONF_OPTS += -DDATAPATH=/userdata/roms/ports/openjazz
OPENJAZZ_CONF_OPTS += -DNETWORK=ON

define OPENJAZZ_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/OpenJazz $(TARGET_DIR)/usr/bin/OpenJazz
	# evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/ports/openjazz/openjazz.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
