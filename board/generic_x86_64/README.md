# Firmware loader for generic x86_64 devices

This loader has been tested on various x86 computers, including legacy BIOS boot
and UEFI boot. Progress is only indicated by the graphics output.
Please notice that the loader will flash the first block device that is found,
therefore make sure that there are no other drives in your target that should
not be overwritten.

## Tested devices

- Intel NUC (BOXNUC7CJYH2) - UEFI boot
- Dell XPS 15 (2012) - Lecagy boot
- QEMU (Legacy and UEFI boot)
