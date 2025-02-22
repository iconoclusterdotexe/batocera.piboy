################################################################################
#
# libretro-fceumm
#
################################################################################
# Version: Commits on Jan 10, 2024
LIBRETRO_FCEUMM_VERSION = fd8d616a50621bd64e2489be155ab909f2ba79a9
LIBRETRO_FCEUMM_SITE = $(call github,libretro,libretro-fceumm,$(LIBRETRO_FCEUMM_VERSION))
LIBRETRO_FCEUMM_LICENSE = GPLv2

LIBRETRO_FCEUMM_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_FCEUMM_PLATFORM = rpi1
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_FCEUMM_PLATFORM = rpi2
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_FCEUMM_PLATFORM = rpi3_64
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_FCEUMM_PLATFORM = rpi4
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
LIBRETRO_FCEUMM_PLATFORM = rpi5
else ifeq ($(BR2_aarch64),y)
LIBRETRO_FCEUMM_PLATFORM = unix
else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
LIBRETRO_FCEUMM_PLATFORM = armv
endif

define LIBRETRO_FCEUMM_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile.libretro
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D) -f Makefile.libretro platform="$(LIBRETRO_FCEUMM_PLATFORM)" \
		GIT_VERSION="-$(shell echo $(LIBRETRO_FCEUMM_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_FCEUMM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/fceumm_libretro.so $(TARGET_DIR)/usr/lib/libretro/fceumm_libretro.so
endef

$(eval $(generic-package))
