# -*-makefile-*-
#
# Copyright (C) 2011 by Juergen Beisert <jbe@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

#
# We provide this package
#
HOST_PACKAGES-$(PTXCONF_HOST_ELFTOSB) += host-elftosb

#
# Paths and names
#
HOST_ELFTOSB_VERSION	:= 10.11.01
HOST_ELFTOSB_MD5	:= 913a7111886a0839866d861d257e9bdc
HOST_ELFTOSB		:= elftosb-$(HOST_ELFTOSB_VERSION)
HOST_ELFTOSB_SUFFIX	:= tar.gz
HOST_ELFTOSB_URL	:= http://wwww.pengutronix.de/software/ptxdist/temporary-src/$(HOST_ELFTOSB).$(HOST_ELFTOSB_SUFFIX)
HOST_ELFTOSB_SOURCE	:= $(SRCDIR)/$(HOST_ELFTOSB).$(HOST_ELFTOSB_SUFFIX)
HOST_ELFTOSB_DIR	:= $(HOST_BUILDDIR)/$(HOST_ELFTOSB)

# ----------------------------------------------------------------------------
# Get
# ----------------------------------------------------------------------------

$(HOST_ELFTOSB_SOURCE):
	@$(call targetinfo)
	@$(call get, HOST_ELFTOSB)

# ----------------------------------------------------------------------------
# Prepare
# ----------------------------------------------------------------------------

$(STATEDIR)/host-elftosb.prepare:
	@$(call targetinfo)
	@$(call touch)

# ----------------------------------------------------------------------------
# Install
# ----------------------------------------------------------------------------

HOST_ELFTOSB_INSTALL_OPT := \
	PREFIX= \
	install

# vim: syntax=make
