# -*-makefile-*-
#
# Copyright (C) 2014 by Marc Kleine-Budde <mkl@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
PACKAGES-$(PTXCONF_IMX_SRK_DEBUG) += imx-srk-debug

#
# Paths and names
#
IMX_SRK_DEBUG_VERSION	:= 1
IMX_SRK_DEBUG		:= imx-srk-debug-$(IMX_SRK_DEBUG_VERSION)
IMX_SRK_DEBUG_DIR	:= $(BUILDDIR)/$(IMX_SRK_DEBUG)
IMX_SRK_DEBUG_LICENSE	:= unknown

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

IMX_SRK_DEBUG_CONF_TOOL	:= NO

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

IMX_SRK_DEBUG_FUSE	:= $(IMX_SRK_DEBUG_DIR)/imx-srk-debug-fuse.bin
IMX_SRK_DEBUG_TABLE	:= $(IMX_SRK_DEBUG_DIR)/imx-srk-debug-table.bin

$(STATEDIR)/imx-srk-debug.compile:
	@$(call targetinfo)
	@mkdir -p $(IMX_SRK_DEBUG_DIR)
	@srktool \
		-h 4 \
		-t $(IMX_SRK_DEBUG_TABLE) \
		-e $(IMX_SRK_DEBUG_FUSE) \
		-d sha256 \
		-c local_src/hab-ca-debug/crts/SRK1_sha256_2048_65537_v3_ca_crt.pem
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/imx-srk-debug.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/imx-srk-debug.targetinstall:
	@$(call targetinfo)
	@rm -f $(IMAGEDIR)/$(notdir $(IMX_SRK_DEBUG_FUSE))
	@install -v -m644 -D $(IMX_SRK_DEBUG_FUSE) \
		$(IMAGEDIR)/$(notdir $(IMX_SRK_DEBUG_FUSE))
	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

$(STATEDIR)/imx-srk-debug.clean:
	@$(call targetinfo)
	@$(call clean_pkg, IMX_SRK_DEBUG)
	@rm -rfv $(IMAGEDIR)/$(notdir $(IMX_SRK_DEBUG_FUSE))

# vim: syntax=make
