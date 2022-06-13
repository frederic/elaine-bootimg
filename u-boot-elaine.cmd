usbbootargs=zswap.enabled=1 zswap.zpool=z3fold zswap.compressor=zstd dwc_otg.lpm_enable=0 console=tty1 root=LABEL=writable rootfstype=ext4 rootwait fixrtc console=ttyS0,115200n8 no_console_suspend consoleblank=0 debug=1 ignore_loglevel=1 earlycon=aml-uart,0xff803000 loglevel=7 
bootimg_loadaddr=0x03080000

pwnboot=echo Loading boot.img from USB!; fatload usb 0 ${bootimg_loadaddr} boot.img; setenv bootargs ${bootargs} ${usbbootargs}; bootm ${bootimg_loadaddr};
