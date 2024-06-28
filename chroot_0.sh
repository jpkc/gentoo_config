#!/bin/bash
tar xpvf /mnt/cdrom/jpkc/iso\ images/linux/Gentoo/stage3-*.tar.xz --xattrs-include='*.*' --numeric-owner
cp /mnt/cdrom/jpkc/iso\ images/linux/Gentoo/make.conf /mnt/gentoo/etc/portage
mirrorselect -i -o >> /mnt/gentoo/etc/portage/make.conf
mkdir --parents /mnt/gentoo/etc/portage/repos.conf
cp /mnt/gentoo/usr/share/portage/config/repos.conf /mnt/gentoo/etc/portage/repos.conf/gentoo.conf

mount /dev/sda6 /mnt/gentoo
mount /dev/sda1 /mnt/gentoo/boot

