################################################################################
#
# doomretro
#
################################################################################
# Version: Commits on Jan 22, 2024
DOOMRETRO_VERSION = f228155bf51ce6cdc1f25639972e75190378068e
DOOMRETRO_SITE = $(call github,bradharding,doomretro,$(DOOMRETRO_VERSION))

DOOMRETRO_DEPENDENCIES = sdl2 sdl2_mixer sdl2_image
DOOMRETRO_LICENSE = GPL-2.0
DOOMRETRO_SUPPORTS_IN_SOURCE_BUILD = NO


$(eval $(cmake-package))
