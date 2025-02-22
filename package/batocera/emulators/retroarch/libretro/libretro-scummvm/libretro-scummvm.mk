################################################################################
#
# libretro-scummvm
#
################################################################################
# Version: Commits on Jan 22, 2024 (branch@branch-2-8)
LIBRETRO_SCUMMVM_VERSION = 83e6e1c7ad3fec9b1979dd4db0c143708ab42d34
LIBRETRO_SCUMMVM_SOURCE = scummvm-$(LIBRETRO_SCUMMVM_VERSION).tar.gz
LIBRETRO_SCUMMVM_SITE = $(call github,scummvm,scummvm,$(LIBRETRO_SCUMMVM_VERSION))
LIBRETRO_SCUMMVM_LICENSE = GPLv2
LIBRETRO_SCUMMVM_DEPENDENCIES = sdl2 zlib jpeg libmpeg2 libogg libvorbis flac libmad libpng libtheora faad2 freetype

LIBRETRO_SCUMMVM_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2835),y)
LIBRETRO_SCUMMVM_PLATFORM = rpi1

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2836),y)
LIBRETRO_SCUMMVM_PLATFORM = rpi2

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2837),y)
LIBRETRO_SCUMMVM_PLATFORM = rpi3_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2711),y)
LIBRETRO_SCUMMVM_PLATFORM = rpi4_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_BCM2712),y)
LIBRETRO_SCUMMVM_PLATFORM = rpi5_64

else ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_S812),y)
LIBRETRO_SCUMMVM_PLATFORM = armv cortexa9 neon hardfloat

else ifeq ($(BR2_aarch64),y)
LIBRETRO_SCUMMVM_PLATFORM = unix
LIBRETRO_SCUMMVM_MAKE_OPTS += TARGET_64BIT=1
endif

define LIBRETRO_SCUMMVM_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/backends/platform/libretro/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/backends/platform/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/backends/platform/libretro \
	platform="$(LIBRETRO_SCUMMVM_PLATFORM)" $(LIBRETRO_SCUMMVM_MAKE_OPTS) all
endef

define LIBRETRO_SCUMMVM_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	mkdir -p $(TARGET_DIR)/usr/share/libretro/info
	$(INSTALL) -D $(@D)/backends/platform/libretro/scummvm_libretro.so   $(TARGET_DIR)/usr/lib/libretro/scummvm_libretro.so
	$(INSTALL) -D $(@D)/backends/platform/libretro/scummvm_libretro.info $(TARGET_DIR)/usr/share/libretro/info/scummvm_libretro.info
endef


define LIBRETRO_GIT_DL
	mkdir -p $(@D)/backends/platform/libretro/deps
	cd $(@D)/backends/platform/libretro/deps && git clone https://github.com/libretro/libretro-deps
	cd $(@D)/backends/platform/libretro/deps && git clone https://github.com/libretro/libretro-common
endef

LIBRETRO_SCUMMVM_POST_EXTRACT_HOOKS = LIBRETRO_GIT_DL

$(eval $(generic-package))
