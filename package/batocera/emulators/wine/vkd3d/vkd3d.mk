################################################################################
#
# vkd3d
#
################################################################################
# Commits on 29 May, 2023
VKD3D_VERSION = 7c360330d74f5c2f6de962355927ee6e7d7dfbf0
VKD3D_SITE = git://source.winehq.org/git/vkd3d
VKD3D_LICENSE = LGPL-2.1+
VKD3D_LICENSE_FILES = COPYING.LIB LICENSE
VKD3D_DEPENDENCIES = host-bison host-flex host-wine-lutris spirv-headers host-libtool vulkan-headers vulkan-loader
VKD3D_CONF_ENV += WIDL="$(BUILD_DIR)/host-wine-lutris-$(WINE_VERSION)/tools/widl/widl"

VKD3D_CONF_OPTS = --disable-tests --with-sysroot=$(STAGING_DIR)

VKD3D_AUTORECONF = YES
VKD3D_INSTALL_STAGING = YES

$(eval $(autotools-package))
