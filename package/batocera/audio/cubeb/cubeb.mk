################################################################################
#
# cubeb
#
################################################################################
# Version: Commits on Dec 12, 2023
CUBEB_VERSION = ed2efe22cb803f022b5a38fbbc53eec250056874
CUBEB_SITE = $(call github,mozilla,cubeb,$(CUBEB_VERSION))

CUBEB_LICENSE = ISC
CUBEB_SUPPORTS_IN_SOURCE_BUILD = NO
CUBEB_INSTALL_STAGING = YES
CUBEB_DEPENDENCIES = alsa-lib speex

CUBEB_CONF_OPTS += -DBUILD_TOOLS=no
CUBEB_CONF_OPTS += -DLAZY_LOAD_LIBS=no
CUBEB_CONF_OPTS += -DUSE_SANITIZERS=no

$(eval $(cmake-package))
