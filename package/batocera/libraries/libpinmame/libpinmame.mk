################################################################################
#
# libpinmame
#
################################################################################
# Version: Commits on Jan 22, 2024
LIBPINMAME_VERSION = ede5ea6d6715d7e6fa2525ca9a61eeb6a9963835
LIBPINMAME_SITE = $(call github,vpinball,pinmame,$(LIBPINMAME_VERSION))
LIBPINMAME_LICENSE = BSD-3-Clause
LIBPINMAME_LICENSE_FILES = LICENSE
LIBPINMAME_DEPENDENCIES = zlib
LIBPINMAME_SUPPORTS_IN_SOURCE_BUILD = NO

# use gcc to build
LIBPINMAME_CONF_OPTS += -DCMAKE_C_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-gcc
LIBPINMAME_CONF_OPTS += -DCMAKE_CXX_COMPILER=$(HOST_DIR)/bin/$(GNU_TARGET_NAME)-g++

define LIBPINMAME_RENAME_CMAKE
	cp $(@D)/cmake/libpinmame/CMakeLists_linux-x64.txt $(@D)/CMakeLists.txt
	rm $(@D)/makefile
endef

define LIBPINMAME_INSTALL_TARGET_CMDS
	# staging files
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/libpinmame.so.3.6 \
		$(STAGING_DIR)/usr/lib
	cp $(@D)/src/libpinmame/libpinmame.h $(STAGING_DIR)/usr/include
	# copy to target
	$(INSTALL) -D -m 0755 $(@D)/buildroot-build/libpinmame.so.3.6 \
		$(TARGET_DIR)/usr/lib
endef

LIBPINMAME_PRE_CONFIGURE_HOOKS += LIBPINMAME_RENAME_CMAKE

$(eval $(cmake-package))
