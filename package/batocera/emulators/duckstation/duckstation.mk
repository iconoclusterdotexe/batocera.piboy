################################################################################
#
# duckstation
#
################################################################################
# Version: Commits on Jan 22, 2024
DUCKSTATION_VERSION = bcf7f55b93d6c61a66c1aabec5b8568d10a5b26c
DUCKSTATION_SITE = https://github.com/stenzek/duckstation.git
DUCKSTATION_SITE_METHOD=git
DUCKSTATION_GIT_SUBMODULES=YES
DUCKSTATION_LICENSE = GPLv2
DUCKSTATION_DEPENDENCIES = fmt boost ffmpeg libcurl ecm libdrm sdl2 libevdev
DUCKSTATION_SUPPORTS_IN_SOURCE_BUILD = NO

DUCKSTATION_CONF_OPTS += -DBUILD_SHARED_LIBS=FALSE
DUCKSTATION_CONF_OPTS += -DENABLE_DISCORD_PRESENCE=OFF
DUCKSTATION_CONF_OPTS += -DUSE_DRMKMS=ON

DUCKSTATION_CONF_ENV += LDFLAGS=-lpthread

ifeq ($(BR2_PACKAGE_WAYLAND),y)
	DUCKSTATION_CONF_OPTS += -DENABLE_WAYLAND=ON
else
	DUCKSTATION_CONF_OPTS += -DENABLE_WAYLAND=OFF
endif

ifeq ($(BR2_PACKAGE_XORG7),y)
	DUCKSTATION_CONF_OPTS += -DENABLE_X11=ON
else
	DUCKSTATION_CONF_OPTS += -DENABLE_X11=OFF
endif

ifeq ($(BR2_PACKAGE_VULKAN_HEADERS)$(BR2_PACKAGE_VULKAN_LOADER),yy)
	DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=ON
else
	DUCKSTATION_CONF_OPTS += -DENABLE_VULKAN=OFF
endif

DUCKSTATION_CONF_OPTS += -DBUILD_QT_FRONTEND=OFF -DBUILD_SDL_FRONTEND=OFF -DBUILD_NOGUI_FRONTEND=ON

ifeq ($(BR2_PACKAGE_XORG7),y)
	DUCKSTATION_CONF_OPTS += -DUSE_GLX=ON
endif

ifeq ($(BR2_PACKAGE_HAS_LIBEGL),y)
	DUCKSTATION_CONF_OPTS += -DUSE_EGL=ON
	ifeq ($(BR2_PACKAGE_HAS_LIBMALI),y)
		DUCKSTATION_CONF_OPTS += -DUSE_MALI=ON
	endif
else
	DUCKSTATION_CONF_OPTS += -DUSE_EGL=OFF
endif

define DUCKSTATION_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/duckstation
	$(INSTALL) -D $(@D)/buildroot-build/bin/duckstation*	$(TARGET_DIR)/usr/bin/duckstation
	cp -pr	$(@D)/data/resources							$(TARGET_DIR)/usr/bin/duckstation/

	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/duckstation/psx.duckstation.keys $(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
