################################################################################
#
# libretro-neocd
#
################################################################################
# Version: Commits on Nov 01, 2023
LIBRETRO_NEOCD_VERSION = 46d2832747578384ffcd76551c47de17b2f4aaf5
LIBRETRO_NEOCD_SITE = https://github.com/libretro/neocd_libretro.git
LIBRETRO_NEOCD_SITE_METHOD=git
LIBRETRO_NEOCD_GIT_SUBMODULES=YES
LIBRETRO_NEOCD_LICENSE = GPLv3

LIBRETRO_NEOCD_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_NEOCD_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_NEOCD_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_NEOCD_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_NEOCD_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
LIBRETRO_NEOCD_PLATFORM = rpi5
endif

define LIBRETRO_NEOCD_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile platform="$(LIBRETRO_NEOCD_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_NEOCD_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_NEOCD_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/neocd_libretro.so $(TARGET_DIR)/usr/lib/libretro/neocd_libretro.so
endef

$(eval $(generic-package))
