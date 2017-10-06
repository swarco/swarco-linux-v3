################################################################################
#
# mobile-data-connector
#
################################################################################

MOBILE_DATA_CONNECTOR_VERSION = HEAD
MOBILE_DATA_CONNECTOR_SITE = $(call github,swarco,mobile-data-connector,$(MOBILE_DATA_CONNECTOR_VERSION))
MOBILE_DATA_CONNECTOR_LICENSE = BSD-2c
MOBILE_DATA_CONNECTOR_LICENSE_FILES = LICENSE
#MOBILE_DATA_CONNECTOR_INSTALL_STAGING = YES
#MOBILE_DATA_CONNECTOR_CONFIG_SCRIPTS = MOBILE_DATA_CONNECTOR-config
#MOBILE_DATA_CONNECTOR_DEPENDENCIES = host-libaaa libbbb

define MOBILE_DATA_CONNECTOR_BUILD_CMDS
    CROSS_CC=$(TARGET_CC) CROSS_STRIP=$(TARGET_STRIP) $(MAKE) $(TARGET_CONFIGURE_OPTS)  -C $(@D) 
endef

define MOBILE_DATA_CONNECTOR_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(TARGET_MAKE_ENV) $(MAKE) -C $(@D) \
		DESTDIR=$(TARGET_DIR) install
endef

# define MOBILE_DATA_CONNECTOR_USERS
#     foo -1 MOBILE_DATA_CONNECTOR -1 * - - - MOBILE_DATA_CONNECTOR daemon
# endef

# define MOBILE_DATA_CONNECTOR_DEVICES
#     /dev/foo  c  666  0  0  42  0  -  -  -
# endef

# define MOBILE_DATA_CONNECTOR_PERMISSIONS
#     /bin/foo  f  4755  foo  MOBILE_DATA_CONNECTOR   -  -  -  -  -
# endef

$(eval $(generic-package))
