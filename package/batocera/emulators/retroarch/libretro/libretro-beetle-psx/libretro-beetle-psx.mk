################################################################################
#
# libretro-beetle-psx
#
################################################################################
# Version: Commits on Jan 19, 2024
LIBRETRO_BEETLE_PSX_VERSION = ad14ba632c73f7666aa48c3b9dc7288aa9c41943
LIBRETRO_BEETLE_PSX_SITE = $(call github,libretro,beetle-psx-libretro,$(LIBRETRO_BEETLE_PSX_VERSION))
LIBRETRO_BEETLE_PSX_LICENSE = GPLv2

LIBRETRO_BEETLE_PSX_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_BEETLE_PSX_PLATFORM = rpi4_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
LIBRETRO_BEETLE_PSX_PLATFORM = rpi5_64
endif

LIBRETRO_BEETLE_PSX_EXTRAOPT=
LIBRETRO_BEETLE_PSX_OUTFILE=mednafen_psx_libretro.so

ifeq ($(BR2_PACKAGE_XORG7),y)
# Batocera - SBC required_hw_api = "OpenGL Core >= 3.3 | Vulkan >= 1.0"
  ifneq ($(BR2_PACKAGE_BATOCERA_SBC_XORG)$(BR2_PACKAGE_XWAYLAND),y)
	LIBRETRO_BEETLE_PSX_EXTRAOPT += HAVE_HW=1
	LIBRETRO_BEETLE_PSX_OUTFILE=mednafen_psx_hw_libretro.so
  endif
endif

define LIBRETRO_BEETLE_PSX_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile $(LIBRETRO_BEETLE_PSX_EXTRAOPT) platform="$(LIBRETRO_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_BEETLE_PSX_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_BEETLE_PSX_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/$(LIBRETRO_BEETLE_PSX_OUTFILE) $(TARGET_DIR)/usr/lib/libretro/mednafen_psx_libretro.so
endef

$(eval $(generic-package))
