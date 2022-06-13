#!/bin/sh

abootimg --create boot.img -f bootimg.cfg -k kernel.elaine.gz-dtb.elaine-b4 -r initrd.img
