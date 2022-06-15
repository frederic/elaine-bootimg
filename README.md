# elaine-bootimg
Resources to run a custom OS like Ubuntu on Google Nest Hub (2nd Gen) (elaine) [by exploiting a vulnerability in U-Boot](https://fredericb.info/2022/06/breaking-secure-boot-on-google-nest-hub-2nd-gen-to-run-ubuntu.html).

## prerequisite
- [Exploitation tool CHIPICOPWN](https://github.com/frederic/chipicopwn)

## installation
1. Install [ubuntu-22.04-preinstalled-desktop-arm64+raspi.img](https://cdimage.ubuntu.com/releases/22.04/release/) on USB flash drive :
```shell
$ dd if=ubuntu-22.04-preinstalled-desktop-arm64+raspi.img of=/dev/<device> bs=1M
```
2. Copy the following files in partition *system-boot* :
- [u-boot-elaine.bin](./u-boot-elaine.bin) : [U-Boot image for elaine](https://github.com/frederic/elaine-u-boot)
- [u-boot-elaine.cmd](./u-boot-elaine.cmd) : U-Boot environment file
- [boot.img](./boot.img) : Boot image ([Kernel for elaine](https://github.com/frederic/elaine-linux), DTB, initrd)

## usage
*See https://github.com/frederic/chipicopwn#usage*

## ramdisk details
The provided ramdisk *initrd.img* comes from Ubuntu preinstalled image for ARM64, and has been repacked to integrate the touchscreen firmware used by elaine device.
```
# Unpack
gzip -cd initrd-ubuntu.img | cpio -i
# Repack
find . | cpio -o -H newc | gzip -9 > initrd.img
```