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
PACKAGES-$(PTXCONF_EVM_KEY_DEBUG) += evm-key-debug

EVM_KEY_DEBUG_VERSION	:= 1

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/evm-key-debug.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/evm-key-debug.targetinstall:
	@$(call targetinfo)

	@$(call install_init, evm-key-debug)
	@$(call install_fixup,evm-key-debug,PRIORITY,optional)
	@$(call install_fixup,evm-key-debug,SECTION,base)
	@$(call install_fixup,evm-key-debug,AUTHOR,"Jan Luebbe <jlu@pengutronix.de>")
	@$(call install_fixup,evm-key-debug,DESCRIPTION,missing)

	@$(call install_copy, evm-key-debug, 0, 0, 0444, $(PTXDIST_WORKSPACE)/local_src/evm-key-debug/debug.der, /etc/evm.der)

	@$(call install_finish,evm-key-debug)

	@$(call touch)

# vim: syntax=make
