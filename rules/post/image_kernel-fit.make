# -*-makefile-*-
#
# Copyright (C) 2003-2010 by the ptxdist project <ptxdist@pengutronix.de>
#               2011, 2012 by Marc Kleine-Budde <mkl@pengutronix.de>
#
# See CREDITS for details about who has contributed to this project.
#
# For further information about the PTXdist project and license conditions
# see the README file.
#

ifdef PTXCONF_IMAGE_KERNEL_FIT
images: $(IMAGEDIR)/linuximage-fit
endif

$(IMAGEDIR)/linuximage-fit: $(PTXDIST_WORKSPACE)/local_src/fit-key-debug/debug-image.its $(IMAGEDIR)/linuximage $(IMAGEDIR)/root.cpio.gz $(IMAGEDIR)/imx28-duckbill.dtb
	@echo "Creating $(notdir $(@)) from $(notdir $(^))..."
	@cp $(PTXDIST_WORKSPACE)/local_src/fit-key-debug/debug-image.its $(IMAGEDIR)
	@cd $(IMAGEDIR) && $(PTXCONF_SYSROOT_HOST)/bin/mkimage \
		-k $(PTXDIST_WORKSPACE)/local_src/fit-key-debug -r \
		-f debug-image.its $@
	@echo "done."

# vim: syntax=make
