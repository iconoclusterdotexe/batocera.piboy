################################################################################
#
# libretro-beetle-supergrafx
#
################################################################################
# Version: Commits on Jan 19, 2024
LIBRETRO_BEETLE_SUPERGRAFX_VERSION = 1258fc3e404624445af14091bfd6517dca058cb4
LIBRETRO_BEETLE_SUPERGRAFX_SITE = $(call github,libretro,beetle-supergrafx-libretro,$(LIBRETRO_BEETLE_SUPERGRAFX_VERSION))
LIBRETRO_BEETLE_SUPERGRAFX_LICENSE = GPLv2

LIBRETRO_BEETLE_SUPERGRAFX_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_BEETLE_SUPERGRAFX_PLATFORM = rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_BEETLE_SUPERGRAFX_PLATFORM = rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_BEETLE_SUPERGRAFX_PLATFORM = rpi3_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_BEETLE_SUPERGRAFX_PLATFORM = rpi4_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
LIBRETRO_BEETLE_SUPERGRAFX_PLATFORM = rpi5_64

endif

define LIBRETRO_BEETLE_SUPERGRAFX_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_BEETLE_SUPERGRAFX_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_BEETLE_SUPERGRAFX_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BEETLE_SUPERGRAFX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/mednafen_supergrafx_libretro.so $(TARGET_DIR)/usr/lib/libretro/mednafen_supergrafx_libretro.so
endef

$(eval $(generic-package))
