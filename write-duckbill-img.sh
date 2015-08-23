#!/bin/sh

set -xe

mkfs.ext4 /dev/mmcblk0p4
mount /dev/mmcblk0p4 /mnt/tmp
cd /mnt/tmp
tar xf /home/jluebbe/ptx/duckbill/platform-duckbill/images/root.tgz
echo signed > /mnt/tmp/signed
echo original > /mnt/tmp/modified
/home/jluebbe/ptx/duckbill/platform-duckbill/sysroot-host/bin/evmctl sign --imahash --key /home/jluebbe/ptx/duckbill/local_src/evm-key-debug/privkey_debug.pem -t fds -u --m32 -v /mnt/tmp -r
echo modified >> /mnt/tmp/modified
echo unsigend > /mnt/tmp/unsigned
cd /
umount /dev/mmcblk0p4

