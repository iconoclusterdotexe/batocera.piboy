################################################################################
#
# batocera-desktopapps
#
################################################################################
BATOCERA_DESKTOPAPPS_VERSION = 1.0
BATOCERA_DESKTOPAPPS_SOURCE=

BATOCERA_DESKTOPAPPS_SCRIPTS = filemanagerlauncher
BATOCERA_DESKTOPAPPS_APPS  = xterm.desktop
BATOCERA_DESKTOPAPPS_ICONS =

# wiimote
BATOCERA_DESKTOPAPPS_APPS	+= xwiishowir.desktop
BATOCERA_DESKTOPAPPS_ICONS   += xwiishowir.png

# pcsx2
ifeq ($(BR2_PACKAGE_PCSX2),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-pcsx2
  BATOCERA_DESKTOPAPPS_APPS	+= pcsx2-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += pcsx2.png
endif

# dolphin
ifeq ($(BR2_PACKAGE_DOLPHIN_EMU)$(BR2_PACKAGE_XORG7),yy)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-dolphin
  BATOCERA_DESKTOPAPPS_APPS	+= dolphin-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += dolphin.png
endif

# dolphin-triforce
ifeq ($(BR2_PACKAGE_DOLPHIN_TRIFORCE),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-dolphin-triforce
  BATOCERA_DESKTOPAPPS_APPS	+= dolphin-triforce-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += dolphin-triforce.png
endif

# duckstation
ifeq ($(BR2_PACKAGE_DUCKSTATION),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-duckstation
  BATOCERA_DESKTOPAPPS_APPS	+= duckstation-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += duckstation.png
endif

# retroarch
ifeq ($(BR2_PACKAGE_RETROARCH),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-retroarch
  BATOCERA_DESKTOPAPPS_APPS	+= retroarch-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += retroarch.png
endif

# ppsspp
ifeq ($(BR2_PACKAGE_PPSSPP),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-ppsspp
  BATOCERA_DESKTOPAPPS_APPS	+= ppsspp-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += ppsspp.png
endif

# flycast
ifeq ($(BR2_PACKAGE_FLYCAST),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-flycast
  BATOCERA_DESKTOPAPPS_APPS	+= flycast-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += flycast.png
endif

# scummvm
ifeq ($(BR2_PACKAGE_SCUMMVM),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-scummvm
  BATOCERA_DESKTOPAPPS_APPS	+= scummvm-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += scummvm.png
endif

# citra
ifeq ($(BR2_PACKAGE_CITRA),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-citra
  BATOCERA_DESKTOPAPPS_APPS	+= citra-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += citra.png
endif

# rpcs3
ifeq ($(BR2_PACKAGE_RPCS3),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-rpcs3
  BATOCERA_DESKTOPAPPS_APPS	+= rpcs3-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += rpcs3.png
endif

# cemu
ifeq ($(BR2_PACKAGE_CEMU),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-cemu
  BATOCERA_DESKTOPAPPS_APPS	+= cemu-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += cemu.png
endif

# fpinball
ifeq ($(BR2_PACKAGE_FPINBALL),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-fpinball
  BATOCERA_DESKTOPAPPS_APPS	+= fpinball-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += fpinball.png
endif

# model2emu
ifeq ($(BR2_PACKAGE_MODEL2EMU),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-model2emu
  BATOCERA_DESKTOPAPPS_APPS	+= model2emu-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += model2emu.png
endif

# flatpak
ifeq ($(BR2_PACKAGE_BAUH),y)
  BATOCERA_DESKTOPAPPS_APPS	+= flatpak-config.desktop
endif

# yuzu
ifeq ($(BR2_PACKAGE_YUZU),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-yuzu
  BATOCERA_DESKTOPAPPS_APPS	+= yuzu-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += yuzu.png
endif

# ryujinx
ifeq ($(BR2_PACKAGE_RYUJINX),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-ryujinx
  BATOCERA_DESKTOPAPPS_APPS	+= ryujinx-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += ryujinx.png
endif

# demul
ifeq ($(BR2_PACKAGE_DEMUL),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-demul
  BATOCERA_DESKTOPAPPS_APPS	+= demul-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += demul.png
endif

# melonds
ifeq ($(BR2_PACKAGE_DEMUL),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-melonds
  BATOCERA_DESKTOPAPPS_APPS	+= melonds-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += melonds.png
endif

# xenia
ifeq ($(BR2_PACKAGE_XENIA),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-xenia
  BATOCERA_DESKTOPAPPS_APPS	+= xenia-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += xenia.png
endif

# xenia-canary
ifeq ($(BR2_PACKAGE_XENIA_CANARY),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-xenia-canary
  BATOCERA_DESKTOPAPPS_APPS	+= xenia-canary-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += xenia-canary.png
endif

# vita3k
ifeq ($(BR2_PACKAGE_VITA3K),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-vita3k
  BATOCERA_DESKTOPAPPS_APPS	+= vita3k-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += vita3k.png
endif

# BigPEmu
ifeq ($(BR2_PACKAGE_BIGPEMU),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-bigpemu
  BATOCERA_DESKTOPAPPS_APPS	+= bigpemu-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += bigpemu.png
endif

# play!
ifeq ($(BR2_PACKAGE_PLAY),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-config-play
  BATOCERA_DESKTOPAPPS_APPS	+= play-config.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += play.png
endif

# Xbox Streaming
ifeq ($(BR2_PACKAGE_XBOX_XCLOUD_CLIENT),y)
  BATOCERA_DESKTOPAPPS_SCRIPTS += batocera-greenlight
  BATOCERA_DESKTOPAPPS_APPS	+= greenlight.desktop
  BATOCERA_DESKTOPAPPS_ICONS   += greenlight.png
endif

define BATOCERA_DESKTOPAPPS_INSTALL_TARGET_CMDS
	# scripts
	mkdir -p $(TARGET_DIR)/usr/bin
	$(foreach f,$(BATOCERA_DESKTOPAPPS_SCRIPTS), cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-desktopapps/scripts/$(f) $(TARGET_DIR)/usr/bin/$(f)$(sep))
	chmod 754  $(TARGET_DIR)/usr/bin/batocera-config-*

	# apps
	mkdir -p $(TARGET_DIR)/usr/share/applications
	$(foreach f,$(BATOCERA_DESKTOPAPPS_APPS), cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-desktopapps/apps/$(f) $(TARGET_DIR)/usr/share/applications/$(f)$(sep))

	# icons
	mkdir -p $(TARGET_DIR)/usr/share/icons/batocera
	$(foreach f,$(BATOCERA_DESKTOPAPPS_ICONS), cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-desktopapps/icons/$(f) $(TARGET_DIR)/usr/share/icons/batocera/$(f)$(sep))

	# menu
	mkdir -p $(TARGET_DIR)/etc/xdg/menus
	cp $(BR2_EXTERNAL_BATOCERA_PATH)/package/batocera/core/batocera-desktopapps/menu/batocera-applications.menu $(TARGET_DIR)/etc/xdg/menus/batocera-applications.menu
endef

$(eval $(generic-package))
