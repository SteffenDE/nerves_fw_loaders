#!/bin/sh

set -e

# Create the Grub environment blocks
grub-editenv $BINARIES_DIR/grubenv create
grub-editenv $BINARIES_DIR/grubenv set boot=1
grub-editenv $BINARIES_DIR/grubenv set validated=1
grub-editenv $BINARIES_DIR/grubenv set booted_once=1

# Copy MBR boot code boot.img
cp $HOST_DIR/usr/lib/grub/i386-pc/boot.img $BINARIES_DIR

# Copy everything that's needed to build firmware images over to the
# output directory so that it can be bundled with the system image.
cp $BR2_EXTERNAL_FIRMWARE_LOADERS_PATH/board/generic_x86_64/grub.cfg $BINARIES_DIR

# Remove the Buildroot-generated grub.cfg so avoid confusion.
# We put our grub in the FAT filesystem at the beginning of the
# disk so that it exists across firmware updates.
rm -fr $TARGET_DIR/boot/grub/*
