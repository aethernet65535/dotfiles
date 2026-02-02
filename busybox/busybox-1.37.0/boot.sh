#!/bin/bash

QEMU_ARGS=(
    -smp 1
    -m 4G
    -kernel $LINUX_MAINLINE/build/qemu/arch/x86_64/boot/bzImage
    -initrd rootfs.img.gz
    -append "root=/dev/ram init=/linuxrc console=ttyS0 nokaslr"
    -drive file=experiment_disk.img,format=raw,if=virtio
    -drive file=swapdisk.img,format=raw,if=virtio
    -serial mon:stdio
    -nographic
)

if [[ "$1" == "d" ]]; then
    echo "==========================="
    echo "DEBUG MODE ENABLE"
    echo "==========================="
    QEMU_ARGS+=("-s" "-S")
fi

./build.sh

sudo qemu-system-x86_64 "${QEMU_ARGS[@]}"
