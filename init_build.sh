#!/bin/sh

. ./config.sh

./0_prereq.sh
./1_qemu.sh
./2_toolchain.sh
./3_linux_prepare.sh
./4_linux.sh
./5_opensbi.sh
./6_rootfs.sh
