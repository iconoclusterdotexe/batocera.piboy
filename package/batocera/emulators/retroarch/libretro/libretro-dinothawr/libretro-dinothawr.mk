################################################################################
#
# libretro-dinothawr
#
################################################################################
# Version: Commits on Apr 01, 2022
LIBRETRO_DINOTHAWR_VERSION = 33fb82a8df4e440f96d19bba38668beaa1b414fc
LIBRETRO_DINOTHAWR_SITE = $(call github,libretro,Dinothawr,$(LIBRETRO_DINOTHAWR_VERSION))
LIBRETRO_DINOTHAWR_LICENSE = Custom
LIBRETRO_DINOTHAWR_LICENSE_FILES = LICENSE
LIBRETRO_DINOTHAWR_NON_COMMERCIAL = y

define LIBRETRO_DINOTHAWR_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="unix"
endef

define LIBRETRO_DINOTHAWR_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/dinothawr_libretro.so $(TARGET_DIR)/usr/lib/libretro/dinothawr_libretro.so
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/dinothawr/dinothawr
	cp -R $(@D)/dinothawr/* $(TARGET_DIR)/usr/share/batocera/datainit/roms/ports/dinothawr/dinothawr
endef

$(eval $(generic-package))
