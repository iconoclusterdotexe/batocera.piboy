################################################################################
#
# guncon
#
################################################################################
# Version: Commits on Sept 23, 2023
GUNCON_VERSION = c5fa9fa19fe32c67b4e36eb9557d8fb06c9d200f
GUNCON_SITE = $(call github,Redemp,guncon2,$(GUNCON_VERSION))

define GUNCON_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/guncon/99-guncon.rules	$(TARGET_DIR)/etc/udev/rules.d/99-guncon.rules
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/controllers/guncon/guncon-add		$(TARGET_DIR)/usr/bin/guncon-add
	$(INSTALL) -D -m 0755 $(@D)/guncon2_calibrate.sh $(TARGET_DIR)/usr/bin/guncon2_calibrate.sh
	$(INSTALL) -D -m 0755 $(@D)/calibrate.py $(TARGET_DIR)/usr/bin/calibrate.py
endef


$(eval $(kernel-module))
$(eval $(generic-package))
