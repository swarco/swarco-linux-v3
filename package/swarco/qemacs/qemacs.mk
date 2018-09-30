################################################################################
#
# qemacs
#
################################################################################

QEMACS_VERSION = 0.3.3
QEMACS_SOURCE = qemacs-$(QEMACS_VERSION).tar.gz
QEMACS_SITE = https://bellard.org/qemacs
QEMACS_LICENSE = LGPLv2.1+
QEMACS_LICENSE_FILES = COPYING

#QEMACS_INSTALL_STAGING = YES
#QEMACS_DEPENDENCIES = host-libaaa libbbb

QEMACS_CONF_OPTS = \
	--target=$(GNU_TARGET_NAME) \
	--host=$(GNU_TARGET_NAME) \
	--build=$(GNU_HOST_NAME) \
	--prefix=/usr/ \
	--includedir=$(STAGING_DIR)/include \
	--oldincludedir=/usr/include \
	--sysconfdir=$(TARGET_DIR)/etc \
	--enable-tiny \
	--disable-x11 \
	--disable-xv \
	--disable-xrender \
	--disable-html \
	--disable-png \
	--disable-plugins

#CFLAGS=" -g -Os -pipe  -funsigned-char -falign-functions=0" 

define QEMACS_CONFIGURE_CMDS
	(cd $(@D) && $(TARGET_CONFIGURE_OPTS) ./configure $(QEMACS_CONF_OPTS))
endef

define QEMACS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CC=$(TARGET_CC)  \
                STRIP="$(STRIPCMD) $(STRIP_STRIP_ALL)" 
endef

define QEMACS_INSTALL_TARGET_CMDS
	$(INSTALL)  -c $(@D)/qe $(TARGET_DIR)/usr/bin
	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/qe
endef


$(eval $(generic-package))
