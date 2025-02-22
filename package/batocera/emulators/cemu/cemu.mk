################################################################################
#
# cemu
#
################################################################################
# Version: Commits on Jan 19, 2024
CEMU_VERSION = ca01e923bf03573d5023feb0f4464ce015910ea6
CEMU_SITE = https://github.com/cemu-project/Cemu
CEMU_LICENSE = GPLv2
CEMU_SITE_METHOD=git
CEMU_GIT_SUBMODULES=YES
CEMU_DEPENDENCIES = boost cubeb fmt glm glslang libpng libzip pugixml rapidjson sdl2 wxwidgets zlib zstd
CEMU_DEPENDENCIES += host-glslang host-libcurl host-pugixml

CEMU_SUPPORTS_IN_SOURCE_BUILD = NO

CEMU_CONF_OPTS += -DBUILD_SHARED_LIBS=OFF
CEMU_CONF_OPTS += -DENABLE_DISCORD_RPC=OFF
CEMU_CONF_OPTS += -DENABLE_VCPKG=OFF
CEMU_CONF_OPTS += -DPORTABLE=OFF
CEMU_CONF_OPTS += -DCMAKE_CXX_FLAGS="$(TARGET_CXXFLAGS) -I$(STAGING_DIR)/usr/include/glslang"
CEMU_CONF_OPTS += -DENABLE_FERAL_GAMEMODE=OFF
CEMU_CONF_OPTS += -DENABLE_HIDAPI=OFF

ifeq ($(BR2_PACKAGE_WAYLAND),y)
	CEMU_CONF_OPTS += -DENABLE_WAYLAND=ON
	CEMU_DEPENDENCIES += wayland wayland-protocols
else
	CEMU_CONF_OPTS += -DENABLE_WAYLAND=OFF
endif

define CEMU_INSTALL_TARGET_CMDS
	mkdir -p $(TARGET_DIR)/usr/bin/cemu/
	mv -f $(@D)/bin/Cemu_release $(@D)/bin/cemu
	cp -pr $(@D)/bin/{cemu,gameProfiles,resources} $(TARGET_DIR)/usr/bin/cemu/
	$(INSTALL) -m 0755 -D $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/cemu/get-audio-device \
		$(TARGET_DIR)/usr/bin/cemu/
	# keys.txt
	mkdir -p $(TARGET_DIR)/usr/share/batocera/datainit/bios/cemu
	touch $(TARGET_DIR)/usr/share/batocera/datainit/bios/cemu/keys.txt
	#evmap config
	mkdir -p $(TARGET_DIR)/usr/share/evmapy
	cp -pr $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/emulators/cemu/wiiu.keys \
		$(TARGET_DIR)/usr/share/evmapy
endef

$(eval $(cmake-package))
