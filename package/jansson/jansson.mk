################################################################################
#
# jansson
#
################################################################################

JANSSON_VERSION = 2.6
JANSSON_SITE = http://www.digip.org/jansson/releases
JANSSON_LICENSE = MIT
JANSSON_LICENSE_FILES = LICENSE
JANSSON_INSTALL_STAGING = YES

$(eval $(autotools-package))
