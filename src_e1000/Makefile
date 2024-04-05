# SPDX-License-Identifier: GPL-2.0

KDIR ?= ../linux
BUILD_DIR ?= $(PWD)/build

default: build

ra:
	$(MAKE) -C $(KDIR) LLVM=1 M=$$PWD rust-analyzer

copy_src:
	-rm -rf $(BUILD_DIR)
	mkdir $(BUILD_DIR)
	find -name "*.rs" -print0 | xargs -0 -I {} cp {} $(BUILD_DIR)
	@echo "default:" > $(BUILD_DIR)/Makefile
	@echo "	\$$(MAKE) -C ../../linux LLVM=1 M=\$$\$$PWD -j\$$(nproc)" >> $(BUILD_DIR)/Makefile
	cp $(PWD)/Kbuild $(BUILD_DIR)/Kbuild

build: copy_src
	$(MAKE) -C $(BUILD_DIR)
	-rm -f $(BUILD_DIR)/*.rs
	-rm $(BUILD_DIR)/Makefile
	-rm $(BUILD_DIR)/Kbuild

PHONY += ra
PHONY += copy_src
