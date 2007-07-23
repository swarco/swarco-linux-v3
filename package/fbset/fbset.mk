#############################################################
#
# fbset
#
#############################################################
FBSET_VERSION:=2.1
FBSET_SOURCE:=fbset-$(FBSET_VERSION).tar.gz
FBSET_SITE:=http://users.telenet.be/geertu/Linux/fbdev
FBSET_DIR:=$(BUILD_DIR)/fbset-$(FBSET_VERSION)
FBSET_CAT:=$(ZCAT)
FBSET_BINARY:=fbset
FBSET_TARGET_BINARY:=usr/sbin/$(FBSET_BINARY)

$(DL_DIR)/$(FBSET_SOURCE):
	$(WGET) -P $(DL_DIR) $(FBSET_SITE)/$(FBSET_SOURCE)

$(FBSET_DIR)/.unpacked: $(DL_DIR)/$(FBSET_SOURCE)
	$(FBSET_CAT) $(DL_DIR)/$(FBSET_SOURCE) | tar -C $(BUILD_DIR) $(TAR_OPTIONS) -
	toolchain/patch-kernel.sh $(FBSET_DIR) package/fbset/ fbset-$(FBSET_VERSION)\*.patch\*
	touch $@

$(FBSET_DIR)/$(FBSET_BINARY): $(FBSET_DIR)/.unpacked
	($(TARGET_CONFIGURE_OPTS) \
	 $(TARGET_CONFIGURE_ARGS) \
		$(MAKE) -C $(FBSET_DIR) CC=$(TARGET_CC) \
	);
	touch -c $@

$(TARGET_DIR)/$(FBSET_TARGET_BINARY): $(FBSET_DIR)/$(FBSET_BINARY)
	$(INSTALL) -m 755 $(FBSET_DIR)/$(FBSET_BINARY) $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
	-$(STRIP) --strip-unneeded $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
	touch -c $@

fbset: linux26 uclibc $(TARGET_DIR)/$(FBSET_TARGET_BINARY)

fbset-clean:
	rm -f $(TARGET_DIR)/$(FBSET_TARGET_BINARY)
	-$(MAKE) -C $(FBSET_DIR) clean

fbset-dirclean:
	rm -rf $(FBSET_DIR)

#############################################################
#
# Toplevel Makefile options
#
#############################################################
ifeq ($(strip $(BR2_PACKAGE_FBSET)),y)
TARGETS+=fbset
endif
