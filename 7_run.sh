#/bin/sh

. ./config.sh

./qemu_build/qemu-system-riscv64 \
    -smp 1 \
    -machine virt \
    -cpu rv64,v=true,vlen=128,sscofpmf=true \
    -m 275m \
    -bios $UBOOT_SPL \
    -kernel $KERNEL_OUT \
    -device loader,file=$UBOOT_PROPER,addr=0x80200000 \
    -device loader,file=$KERNEL_OUT,addr=0x88000000 \
    -device loader,file=$ROOTS_OUT,addr=0x8c300000 \
    -device VGA \
    -display gtk,gl=on \
    -append "console=tty0 console=ttyS0 earlycon root=/dev/ram0 rw init=/init" \
    -device virtio-net-device,netdev=net \
    -device qemu-xhci,id=xhci \
    -device usb-kbd,bus=xhci.0 \
    -device usb-tablet,bus=xhci.0 \
    -netdev user,id=net,hostfwd=tcp::2345-:2345,hostfwd=tcp::10022-:22 \
    -serial mon:stdio  \
    $1
    
# setenv ramdisk_addr_r 0x8a300000 for 256

