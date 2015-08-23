# -*-makefile-*-
#
# Copyright (C) 2015 by Jan Luebbe <jlu@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
HOST_PACKAGES-$(PTXCONF_HOST_IMA_EVM_UTILS) += host-ima-evm-utils

# ----------------------------------------------------------------------------
# Extract
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-ima-evm-utils.extract:
#	@$(call targetinfo)
#	@$(call clean, $(HOST_IMA_EVM_UTILS_DIR))
#	@$(call extract, IMA_EVM_UTILS, $(HOST_BUILDDIR))
#	@$(call patchin, IMA_EVM_UTILS, $(HOST_IMA_EVM_UTILS_DIR))
#	@$(call touch)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

#HOST_IMA_EVM_UTILS_CONF_ENV	:= $(HOST_ENV)

#
# autoconf
#
HOST_IMA_EVM_UTILS_CONF_TOOL	:= autoconf
#HOST_IMA_EVM_UTILS_CONF_OPT	:= $(HOST_AUTOCONF)

#$(STATEDIR)/host-ima-evm-utils.prepare:
#	@$(call targetinfo)
#	@$(call clean, $(HOST_IMA_EVM_UTILS_DIR)/config.cache)
#	cd $(HOST_IMA_EVM_UTILS_DIR) && \
#		$(HOST_IMA_EVM_UTILS_PATH) $(HOST_IMA_EVM_UTILS_ENV) \
#		./configure $(HOST_IMA_EVM_UTILS_CONF_OPT)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Compile
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-ima-evm-utils.compile:
#	@$(call targetinfo)
#	@$(call world/compile, HOST_IMA_EVM_UTILS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-ima-evm-utils.install:
#	@$(call targetinfo)
#	@$(call world/install, HOST_IMA_EVM_UTILS)
#	@$(call touch)

# ----------------------------------------------------------------------------
# Clean
# ----------------------------------------------------------------------------

#$(STATEDIR)/host-ima-evm-utils.clean:
#	@$(call targetinfo)
#	@$(call clean_pkg, HOST_IMA_EVM_UTILS)

# vim: syntax=make
