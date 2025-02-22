################################################################################
#
# libretro-ffmpeg
#
################################################################################
# Version: Commits on Aug 28, 2020
LIBRETRO_FFMPEG_VERSION = 4920879d2f09a78cdf855403c349457cee1c31da
LIBRETRO_FFMPEG_SITE = $(call github,libretro,FFmpeg,$(LIBRETRO_FFMPEG_VERSION))
LIBRETRO_FFMPEG_LICENSE = GPL-3.0

LIBRETRO_FFMPEG_EXTRA_ARGS += ARCH_X86=0
LIBRETRO_FFMPEG_EXTRA_ARGS += ARCH_X86_64=0
LIBRETRO_FFMPEG_EXTRA_ARGS += OPENGL=0
LIBRETRO_FFMPEG_EXTRA_ARGS += LIBRETRO_EMBED_FFMPEG=1

define LIBRETRO_FFMPEG_BUILD_CMDS
	$(SED) "s|-O2|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(SED) "s|-O3|$(TARGET_OPTIMIZATION)|g" $(@D)/libretro/Makefile
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/libretro -f Makefile platform="unix" $(LIBRETRO_FFMPEG_EXTRA_ARGS)
endef

define LIBRETRO_FFMPEG_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/lib/libretro
	$(INSTALL) -D $(@D)/libretro/ffmpeg_libretro.so $(TARGET_DIR)/usr/lib/libretro/ffmpeg_libretro.so
endef

$(eval $(generic-package))
