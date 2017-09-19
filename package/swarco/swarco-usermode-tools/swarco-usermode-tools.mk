################################################################################
#
# swarco-usermode-tools
#
################################################################################

SWARCO_USERMODE_TOOLS_VERSION = HEAD
SWARCO_USERMODE_TOOLS_SITE = $(call github,swarco,swarco-usermode-tools,$(SWARCO_USERMODE_TOOLS_VERSION))
SWARCO_USERMODE_TOOLS_LICENSE = GPLv2
SWARCO_USERMODE_TOOLS_LICENSE_FILES = COPYING
#SWARCO_USERMODE_TOOLS_INSTALL_STAGING = YES
#SWARCO_USERMODE_TOOLS_CONFIG_SCRIPTS = SWARCO_USERMODE_TOOLS-config
#SWARCO_USERMODE_TOOLS_DEPENDENCIES = host-libaaa libbbb

define SWARCO_USERMODE_TOOLS_BUILD_CMDS
    CROSS_CC=$(TARGET_CC) CROSS_STRIP=$(TARGET_STRIP) $(MAKE) $(TARGET_CONFIGURE_OPTS) KERNEL_PATH=../linux-linux-3.4.y-ccm2200  -C $(@D) 
endef

# define SWARCO_USERMODE_TOOLS_INSTALL_STAGING_CMDS
#     $(INSTALL) -D -m 0755 $(@D)/SWARCO_USERMODE_TOOLS.a $(STAGING_DIR)/usr/lib/SWARCO_USERMODE_TOOLS.a
#     $(INSTALL) -D -m 0644 $(@D)/foo.h $(STAGING_DIR)/usr/include/foo.h
#     $(INSTALL) -D -m 0755 $(@D)/SWARCO_USERMODE_TOOLS.so* $(STAGING_DIR)/usr/lib
# endef

define SWARCO_USERMODE_TOOLS_INSTALL_TARGET_CMDS
#    $(INSTALL) -D -m 0755 $(@D)/SWARCO_USERMODE_TOOLS.so* $(TARGET_DIR)/usr/lib
#    $(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/foo.d
	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		DESTDIR=$(TARGET_DIR) install
endef

# define SWARCO_USERMODE_TOOLS_USERS
#     foo -1 SWARCO_USERMODE_TOOLS -1 * - - - SWARCO_USERMODE_TOOLS daemon
# endef

# define SWARCO_USERMODE_TOOLS_DEVICES
#     /dev/foo  c  666  0  0  42  0  -  -  -
# endef

# define SWARCO_USERMODE_TOOLS_PERMISSIONS
#     /bin/foo  f  4755  foo  SWARCO_USERMODE_TOOLS   -  -  -  -  -
# endef

$(eval $(generic-package))
