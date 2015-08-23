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
PACKAGES-$(PTXCONF_IMA_EVM_INIT) += ima-evm-init

IMA_EVM_INIT_VERSION	:= 1

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

$(STATEDIR)/ima-evm-init.install:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Target-Install
# ----------------------------------------------------------------------------

$(STATEDIR)/ima-evm-init.targetinstall:
	@$(call targetinfo)

	@$(call install_init, ima-evm-init)
	@$(call install_fixup,ima-evm-init,PRIORITY,optional)
	@$(call install_fixup,ima-evm-init,SECTION,base)
	@$(call install_fixup,ima-evm-init,AUTHOR,"Jan Luebbe <jlu@pengutronix.de>")
	@$(call install_fixup,ima-evm-init,DESCRIPTION,missing)

	@$(call install_alternative,ima-evm-init, 0, 0, 0700, /init)

	@$(call install_finish,ima-evm-init)

	@$(call touch)

# vim: syntax=make
