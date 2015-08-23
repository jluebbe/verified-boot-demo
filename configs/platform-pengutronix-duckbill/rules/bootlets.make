# -*-makefile-*-
#
# Copyright (C) 2010 by Juergen Beisert <jbe@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_BOOTLETS) += bootlets

#
# Paths and names
#
BOOTLETS_VERSION	:= 10.08.01
BOOTLETS		:= imx-bootlets-src-$(BOOTLETS_VERSION)
BOOTLETS_SUFFIX		:= tar.gz
BOOTLETS_URL		:= http://www.pengutronix.de/software/ptxdist/temporary-src/$(BOOTLETS).$(BOOTLETS_SUFFIX)
BOOTLETS_MD5		:= 85e2ce99c26375dddd9c6b4ef656b595
BOOTLETS_SOURCE		:= $(SRCDIR)/$(BOOTLETS).$(BOOTLETS_SUFFIX)
BOOTLETS_DIR		:= $(BUILDDIR)/$(BOOTLETS)
BOOTLETS_LICENSE	:= GPLv2
PTXCONF_BOOTLETS_SERIES	:= series.$(PTXCONF_PLATFORM)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(BOOTLETS_SOURCE):
	@$(call targetinfo)
	@$(call get, BOOTLETS)

# ----------------------------------------------------------------------------
# Prepare (nothing)
# ----------------------------------------------------------------------------

BOOTLETS_COMPILE_DEPS :=

ifdef PTXCONF_BOOTLETS_KERNEL
BOOTLETS_COMPILE_DEPS += $(STATEDIR)/kernel.targetinstall.post
endif

ifdef PTXCONF_BOOTLETS_BOOTLOADER
BOOTLETS_COMPILE_DEPS += $(STATEDIR)/barebox.targetinstall
endif

$(STATEDIR)/bootlets.prepare: $(BOOTLETS_COMPILE_DEPS)
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

# do not use ':=' here!
BOOTLETS_MAKE_OPT = \
	BOARD=iMX28_EVK \
	CROSS_COMPILE=$(PTXCONF_GNU_TARGET)- \
	ARCH=mx28 \
	ELFTOSB="$(PTXDIST_SYSROOT_HOST)/bin/elftosb"

ifdef PTXCONF_BOOTLETS_DEBUG
BOOTLETS_MAKE_OPT += DEBUG=1
endif

ifdef PTXCONF_BOOTLETS_KERNEL
BOOTLETS_MAKE_OPT += linux_stream DFT_IMAGE=$(IMAGEDIR)/linuximage
endif

ifdef PTXCONF_BOOTLETS_BOOTLOADER
BOOTLETS_MAKE_OPT += bootloader_stream DFT_UBOOT=$(BAREBOX_DIR)/barebox
endif

ifdef PTXCONF_BOOTLETS_MOBILESDRAM
BOOTLETS_MAKE_OPT += MEM_TYPE=MEM_MDDR
else
BOOTLETS_MAKE_OPT += MEM_TYPE=MEM_DDR1
endif

ifdef PTXCONF_BOOTLETS_ENCRYPT

ifdef PTXCONF_BOOTLETS_ZERO_ENCRYPT
BOOTLETS_MAKE_OPT += ELFTOSB_KEY_PARAM="-z"
endif

ifdef PTXCONF_BOOTLETS_KEY_ENCRYPT
BOOTLETS_MAKE_OPT += ELFTOSB_KEY_PARAM="-k $(PTXDIST_WORKSPACE)/$(PTXCONF_BOOTLETS_KEYFILE_ENCRYPT)"
endif

else
BOOTLETS_MAKE_OPT += ELFTOSB_KEY_PARAM=
endif

# Package's build system is broken
BOOTLETS_MAKE_PAR := NO

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/bootlets.install:
	@$(call targetinfo)
ifdef PTXCONF_BOOTLETS_KERNEL
ifdef PTXCONF_BOOTLETS_CPU_T1
	@cp $(BOOTLETS_DIR)/linux_stream_ivt $(IMAGEDIR)/sd_card_linux_bootstream
else
	@cp $(BOOTLETS_DIR)/linux_stream $(IMAGEDIR)/sd_card_linux_bootstream
endif
endif
ifdef PTXCONF_BOOTLETS_BOOTLOADER
ifdef PTXCONF_BOOTLETS_CPU_T1
	@cp $(BOOTLETS_DIR)/bootloader_stream_ivt $(IMAGEDIR)/sd_card_bootloader_bootstream
else
	@cp $(BOOTLETS_DIR)/bootloader_stream $(IMAGEDIR)/sd_card_bootloader_bootstream
endif
endif
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install (nothing)
# ----------------------------------------------------------------------------

$(STATEDIR)/bootlets.targetinstall:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/bootlets.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, BOOTLETS)

# vim: syntax=make
