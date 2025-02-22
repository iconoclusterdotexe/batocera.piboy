################################################################################
#
# libretro-mrboom
#
################################################################################
# Version: Commits on Jan 12, 2024
LIBRETRO_MRBOOM_VERSION = 553ddd34ac0199c0c549497d6a7558edb8bec462
LIBRETRO_MRBOOM_SITE = https://github.com/Javanaise/mrboom-libretro.git
LIBRETRO_MRBOOM_SITE_METHOD=git
LIBRETRO_MRBOOM_GIT_SUBMODULES=YES
LIBRETRO_MRBOOM_LICENSE=GPLv2

ifeq ($(BR2_ARM_FPU_NEON_VFPV4)$(BR2_ARM_FPU_NEON)$(BR2_ARM_FPU_NEON_FP_ARMV8),y)
LIBRETRO_MRBOOM_EXTRA_ARGS = HAVE_NEON=1
endif

define LIBRETRO_MRBOOM_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform=unix $(LIBRETRO_MRBOOM_EXTRA_ARGS) \
		GIT_VERSION="-$(shell echo $(LIBRETRO_MRBOOM_VERSION) | cut -c 1-7)"
endef

define LIBRETRO_MRBOOM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/emulationstation/ports/mrboom
	$(INSTALL) -D $(@D)/mrboom_libretro.so $(TARGET_DIR)/usr/lib/libretro/mrboom_libretro.so
	cp -a  $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/retroarch/libretro/libretro-mrboom/media/* $(TARGET_DIR)/usr/share/emulationstation/ports/mrboom/
endef

$(eval $(generic-package))
