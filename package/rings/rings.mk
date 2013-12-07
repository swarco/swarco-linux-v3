################################################################################
#
# rings
#
################################################################################

RINGS_VERSION = 1.2.3
RINGS_SITE = http://github.com/downloads/keplerproject/rings
RINGS_DEPENDENCIES = lua
RINGS_LICENSE = MIT

define RINGS_BUILD_CMDS
	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS) -fPIC"
endef

define RINGS_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) LUA_LIBDIR="$(TARGET_DIR)/usr/lib/lua" \
		LUA_DIR="$(TARGET_DIR)/usr/share/lua" install
endef

$(eval $(generic-package))
