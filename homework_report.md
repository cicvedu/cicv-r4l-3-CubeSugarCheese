# 作业1：编译Linux内核
在 WSL2 ubuntu 22.04 环境中完成

# 作业2：对Linux内核进行一些配置
## 1、编译成内核模块，是在哪个文件中以哪条语句定义的？
Makefile line 6:  
`$(MAKE) -C $(KDIR) M=$$PWD`  
## 2、该模块位于独立的文件夹内，却能编译成Linux内核模块，这叫做out-of-tree module，请分析它是如何与内核代码产生联系的？
`-C $(KDIR)` 指定了执行 linux 内核源码下的根 Makefile
同时传入了 `M=$$PWD` 参数指定内核模块的目录  
参见 Makefile line 132-136
```makefile
# Use make M=dir or set the environment variable KBUILD_EXTMOD to specify the
# directory of external module to build. Setting M= takes precedence.
ifeq ("$(origin M)", "command line")
  KBUILD_EXTMOD := $(M)
endif
```

```bash
~ # insmod r4l_e1000_demo.ko
[   24.797960] r4l_e1000_demo: loading out-of-tree module taints kernel.
[   24.802201] r4l_e1000_demo: Rust for linux e1000 driver demo (init)
[   24.802720] r4l_e1000_demo: Rust for linux e1000 driver demo (probe): None
[   24.913644] ACPI: \_SB_.LNKC: Enabled at IRQ 11
[   24.935075] r4l_e1000_demo: Rust for linux e1000 driver demo (net device get)
[   24.936925] insmod (80) used greatest stack depth: 12312 bytes left
~ # ip link set eth0 up
[   33.413576] r4l_e1000_demo: Rust for linux e1000 driver demo (net device ope)
[   33.416002] r4l_e1000_demo: Rust for linux e1000 driver demo (net device get)
[   33.418298] IPv6: ADDRCONF(NETDEV_CHANGE): eth0: link becomes ready
~ # [   33.425490] r4l_e1000_demo: Rust for linux e1000 driver demo (net device)
[   33.430414] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta0
[   33.430943] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   33.431216] r4l_e1000_demo: pending_irqs: 3
[   33.431654] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
[   33.679966] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta0
[   33.680211] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   33.680299] r4l_e1000_demo: pending_irqs: 3
[   33.680462] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
[   33.975629] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta0
[   33.975886] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   33.976009] r4l_e1000_demo: pending_irqs: 3
[   33.976167] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
[   34.744232] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta0
[   34.744447] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   34.744597] r4l_e1000_demo: pending_irqs: 3
[   34.744686] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
[   34.745046] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta0
[   34.745423] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   34.745503] r4l_e1000_demo: pending_irqs: 3
[   34.745840] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
[   35.703826] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta0
[   35.704034] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   35.704178] r4l_e1000_demo: pending_irqs: 3
[   35.704332] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
[   39.479605] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta0
[   39.479868] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   39.480038] r4l_e1000_demo: pending_irqs: 3
[   39.480278] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
[   48.183540] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta0
[   48.183900] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   48.184060] r4l_e1000_demo: pending_irqs: 3
[   48.184456] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
ip addr add broadcast 10.0.2.255 dev eth0
[   49.936831] r4l_e1000_demo: Rust for linux e1000 driver demo (net device get)
[   49.938075] r4l_e1000_demo: Rust for linux e1000 driver demo (net device get)
ip: RTNETLINK answers: Invalid argument
~ # ip addr add broadcast 10.0.2.255 dev eth0
[   57.192062] r4l_e1000_demo: Rust for linux e1000 driver demo (net device get)
[   57.192353] r4l_e1000_demo: Rust for linux e1000 driver demo (net device get)
ip: RTNETLINK answers: Invalid argument
~ # ip addr add 10.0.2.15/255.255.255.0 dev eth0
[   63.853620] r4l_e1000_demo: Rust for linux e1000 driver demo (net device get)
[   63.853963] r4l_e1000_demo: Rust for linux e1000 driver demo (net device get)
~ # [   64.567340] r4l_e1000_demo: Rust for linux e1000 driver demo (net device0
[   64.567637] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   64.567771] r4l_e1000_demo: pending_irqs: 3
[   64.567931] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
ip route add default via 10.0.2.1
~ # ip route add default via 10.0.2.1
ip: RTNETLINK answers: File exists
~ # ping 10.0.2.2
PING 10.0.2.2 (10.0.2.2): 56 data bytes
[   82.912875] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta0
[   82.913297] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   82.913386] r4l_e1000_demo: pending_irqs: 131
[   82.913633] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
[   82.914862] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta1
[   82.915095] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   82.915346] r4l_e1000_demo: pending_irqs: 131
[   82.915949] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
64 bytes from 10.0.2.2: seq=0 ttl=255 time=9.431 ms
[   83.919497] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta2
[   83.919850] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   83.919912] r4l_e1000_demo: pending_irqs: 131
[   83.919982] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
64 bytes from 10.0.2.2: seq=1 ttl=255 time=1.053 ms
[   84.920953] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta3
[   84.921192] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   84.921314] r4l_e1000_demo: pending_irqs: 131
[   84.921375] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
64 bytes from 10.0.2.2: seq=2 ttl=255 time=1.196 ms
[   85.922607] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta4
[   85.922999] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   85.923127] r4l_e1000_demo: pending_irqs: 131
[   85.923261] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
64 bytes from 10.0.2.2: seq=3 ttl=255 time=1.197 ms
[   86.924418] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta5
[   86.924650] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   86.924706] r4l_e1000_demo: pending_irqs: 131
[   86.924773] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
64 bytes from 10.0.2.2: seq=4 ttl=255 time=0.692 ms
[   87.925833] r4l_e1000_demo: Rust for linux e1000 driver demo (net device sta6
[   87.926691] r4l_e1000_demo: Rust for linux e1000 driver demo (handle_irq)
[   87.926775] r4l_e1000_demo: pending_irqs: 131
[   87.926865] r4l_e1000_demo: Rust for linux e1000 driver demo (napi poll)
64 bytes from 10.0.2.2: seq=5 ttl=255 time=1.530 ms
^C
--- 10.0.2.2 ping statistics ---
6 packets transmitted, 6 packets received, 0% packet loss
round-trip min/avg/max = 0.692/2.516/9.431 ms
```
# 作业4：为e1000网卡驱动添加remove代码
发现 pci::Device 的绑定不完整，remove 中缺少 &mut pci::Device 参数，且缺少 pci_disable_device，pci_release_regions 两个函数的绑定，手动补全后能够正常释放资源。

# 作业5：注册字符设备
## Q：作业5中的字符设备/dev/cicv是怎么创建的？它的设备号是多少？它是如何与我们写的字符设备驱动关联上的？
build_image.sh line27
```bash
# 创建 cicv 设备文件，指定为字符设备，主设备号为 248，次设备号为 0
echo "mknod /dev/cicv c 248 0" >> etc/init.d/rcS
```
在启动 linux 时，会自动运行 init.d 脚本
而在`rust_chrdev.rs`中，通过`Registration::register`注册设备，而该函数又会调用`alloc_chrdev_region`函数动态分配设备号，`cat /proc/devices`可以看到创建的字符设备`248 rust_chrdev`，在通过上面的命令在`/dev`下创建了设备文件。

# 项目小试验
手动补全了 Task::comm 的绑定，只是 CStr 转换成 &str 失败了，不知道哪里有问题
