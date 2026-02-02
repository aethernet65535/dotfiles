#!/bin/bash
sudo cp $LINUX/modules/mainline/ctor/ctor.ko ./_install/
sudo cp $LINUX/modules/mainline/illegal/illegal.ko ./_install/
sudo cp $LINUX/modules/mainline/mm_test/mm_test.ko ./_install/

sudo cp $LINUX/user/program/master/malloc/malloc ./_install/
sudo cp $LINUX/user/program/master/mmap/mmap ./_install/
sudo cp $LINUX/user/program/master/memory/memory ./_install/
sudo cp $LINUX/user/program/master/mm_stress/test ./_install/

rm -rf rootfs.ext3 rootfs.img.gz
genext2fs -d ./_install -b 32768 rootfs.ext3
tune2fs -j rootfs.ext3
gzip --best -c rootfs.ext3 > rootfs.img.gz
