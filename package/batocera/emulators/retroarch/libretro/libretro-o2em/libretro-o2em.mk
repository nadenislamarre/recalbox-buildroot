################################################################################
#
# O2EM
#
################################################################################
# Version.: Commits on Feb 03, 2020
LIBRETRO_O2EM_VERSION = b23a796dd3490e979ff43710317df6d43bd661e1
LIBRETRO_O2EM_SITE = $(call github,libretro,libretro-o2em,$(LIBRETRO_O2EM_VERSION))
LIBRETRO_O2EM_LICENSE = Artistic License

LIBRETRO_O2EM_PLATFORM = $(LIBRETRO_PLATFORM)

ifeq ($(BR2_PACKAGE_BATOCERA_TARGET_RPI3),y)
	LIBRETRO_O2EM_PLATFORM = armv
endif

define LIBRETRO_O2EM_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE) CXX="$(TARGET_CXX)" CC="$(TARGET_CC)" -C $(@D)/ -f Makefile platform="$(LIBRETRO_O2EM_PLATFORM)"
endef

define LIBRETRO_O2EM_INSTALL_TARGET_CMDS
	$(INSTALL) -D $(@D)/o2em_libretro.so \
		$(TARGET_DIR)/usr/lib/libretro/o2em_libretro.so
endef

$(eval $(generic-package))
