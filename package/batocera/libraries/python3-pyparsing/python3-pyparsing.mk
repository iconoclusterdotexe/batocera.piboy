################################################################################
#
# python3-pyparsing
#
################################################################################

PYTHON3_PYPARSING_VERSION = 2.4.7
PYTHON3_PYPARSING_SOURCE = pyparsing-$(PYTHON3_PYPARSING_VERSION).tar.gz
PYTHON3_PYPARSING_SITE = https://files.pythonhosted.org/packages/c1/47/dfc9c342c9842bbe0036c7f763d2d6686bcf5eb1808ba3e170afdb282210
PYTHON3_PYPARSING_LICENSE = MIT
PYTHON3_PYPARSING_LICENSE_FILES = LICENSE
PYTHON3_PYPARSING_SETUP_TYPE = setuptools

HOST_PYTHON3_PYPARSING_NEEDS_HOST_PYTHON = python3

#batocera
PYTHON_PYPARSING_INSTALL_STAGING = YES

$(eval $(python-package))
#batocera
$(eval $(host-python-package))
