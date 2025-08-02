include $(TOPDIR)/rules.mk

PKG_NAME:=checkpy
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/checkpy
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Python 3.9 Checker
endef

# Thêm bước prepare để copy source vào thư mục build
define Build/Prepare
	$(CP) ./src/* $(PKG_BUILD_DIR)/
endef

# Bước biên dịch
define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) -o $(PKG_BUILD_DIR)/checkpy $(PKG_BUILD_DIR)/checkpy.c
endef

# Bước cài đặt file binary vào thư mục gói
define Package/checkpy/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/checkpy $(1)/usr/bin/
endef

$(eval $(call BuildPackage,checkpy))

