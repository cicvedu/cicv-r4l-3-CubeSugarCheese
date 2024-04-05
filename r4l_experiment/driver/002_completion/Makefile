KDIR := ../../../linux
PWD := $(shell pwd)
BUILD_DIR ?= $(PWD)/build

default: build

all:
	$(MAKE) LLVM=1 -C $(KDIR)  M=$(PWD) modules

copy_src:
	-rm -rf $(BUILD_DIR)
	mkdir $(BUILD_DIR)
	find -name "*.rs" -print0 | xargs -0 -I {} cp {} $(BUILD_DIR)
	cp template.mk $(BUILD_DIR)/Makefile

build: copy_src
	$(MAKE) -C $(BUILD_DIR)
	-rm -f $(BUILD_DIR)/*.rs
	-rm $(BUILD_DIR)/Makefile

ra:
	$(MAKE) -C $(KDIR) LLVM=1 M=$$PWD rust-analyzer

.PHONY: clean ra build copy_src
clean:
	rm -f *.ko *.o .*.cmd .*.o.d *.mod *.mod.o *.mod.c *.symvers *.markers *.unsigned *.order *~