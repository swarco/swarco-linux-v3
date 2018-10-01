################################################################################
#
# qemacs
#
################################################################################

QEMACS_VERSION = 0.3.3
#QEMACS_SOURCE = qemacs-$(QEMACS_VERSION).tar.gz
#QEMACS_SITE = https://bellard.org/qemacs
QEMACS_SITE=cvs://cvs.savannah.nongnu.org:/sources/qemacs
QEMACS_VERSION= HEAD
QEMACS_LICENSE = LGPLv2.1+
QEMACS_LICENSE_FILES = COPYING

#QEMACS_INSTALL_STAGING = YES
#QEMACS_DEPENDENCIES = host-libaaa libbbb

QEMACS_CONF_OPTS = \
	--prefix=/usr \
	--cross-prefix=$(TARGET_CROSS) \
	--cpu=$(BR2_ARCH) \
	--enable-tiny \
	--disable-x11 \
	--disable-xv \
	--disable-xshm \
	--disable-xrender \
	--disable-html \
	--disable-png \
	--disable-plugins \
	--disable-ffmpeg

#CFLAGS=" -g -Os -pipe  -funsigned-char -falign-functions=0" 

define QEMACS_CONFIGURE_CMDS
	( cd $(@D);                                     \
		$(TARGET_CONFIGURE_OPTS)                \
		$(TARGET_CONFIGURE_ARGS)                \
		./configure                             \
			$(QEMACS_CONF_OPTS);		\
	)
endef

define QEMACS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) V=1  \
		LDFLAGS="-L$(STAGING_DIR)/usr/lib"
endef

define QEMACS_INSTALL_TARGET_CMDS
	$(INSTALL)  -c $(@D)/qe $(TARGET_DIR)/usr/bin
	$(STRIPCMD) $(STRIP_STRIP_ALL) $(TARGET_DIR)/usr/bin/qe
endef


$(eval $(generic-package))
