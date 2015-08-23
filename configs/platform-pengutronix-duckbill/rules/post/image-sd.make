$(IMAGEDIR)/sd.hdimg: $(IMAGEDIR)/barebox-duckbill-sd.img
$(IMAGEDIR)/sd.hdimg: $(IMAGEDIR)/barebox-zero-environment
$(IMAGEDIR)/sd.hdimg: $(IMAGEDIR)/linuximage-fit
$(IMAGEDIR)/sd.hdimg: $(IMAGEDIR)/root.ext2
