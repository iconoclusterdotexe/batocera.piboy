################################################################################
#
# wine-mono-lutris
#
################################################################################
# Wine Mono addon (required)
WINE_MONO_VERSION = 8.1.0
WINE_MONO_SOURCE = wine-mono-$(WINE_MONO_VERSION)-x86.tar.xz
WINE_MONO_SITE = https://github.com/madewokherd/wine-mono/releases/download/wine-mono-$(WINE_MONO_VERSION)

# Wine Gecko addon (required)
#WINE_GECKO_VERSION = 2.47.1
#WINE_GECKO_SOURCE = wine-gecko-$(WINE_GECKO_VERSION)-x86.tar.bz2
#WINE_GECKO_SITE = https://dl.winehq.org/wine/wine-gecko/$(WINE_GECKO_VERSION)/$(WINE_GECKO_SOURCE)

define WINE_MONO_EXTRACT_CMDS
	mkdir -p $(@D)/target/usr/wine/lutris/share/wine/mono/ && cd $(@D)/target/usr/wine/lutris/share/wine/mono/ && tar xf $(DL_DIR)/$(WINE_MONO_DL_SUBDIR)/$(WINE_MONO_SOURCE)
endef

define WINE_MONO_INSTALL_TARGET_CMDS
	cp -prn $(@D)/target/* $(TARGET_DIR)
endef


$(eval $(generic-package))
