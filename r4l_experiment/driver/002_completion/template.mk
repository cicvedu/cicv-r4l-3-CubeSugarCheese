ifneq ($(KERNELRELEASE),)

# In kbuild context
module-objs := rcompletion.o	
obj-m := rcompletion.o

CFLAGS_hello_world.o := -DDEBUG
else

default:
	$(MAKE) -C ../../../../linux LLVM=1 M=$$PWD -j$(nproc)
endif