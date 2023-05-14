#!/bin/bash

# Do a clean update.
#  Friendly Reminders:
#	$ equery depends ffmpeg
#	$ cat /proc/cmdline # Handy for mitigations=off check
#	$ grep . /sys/devices/system/cpu/vulnerabilities/*
#	$ ./spectre-meltdown-checker.sh --explain
#	$ USE=-war emerge @world (https://www.shellcheck.net/)
#	$ setfont LatArCyrHeb-16 (/usr/share/consolefonts)
#	$ loadkeys de-latin1 br-latin1-us (/usr/share/keymaps(/i386/qwertz/))

emerge --ask --update --deep --with-bdeps=y --newuse --changed-use --keep-going --noreplace @world
emerge @preserved-rebuild
emerge --depclean

# Backup old config
cp /usr/src/linux/.config /usr/src/.config_old

# Change kernel source:
eselect kernel list
eselect kernel set <new kernel list number>

# genkernel 
#	--kernel-config=/usr/src/linux/.config${NAME}
#	--kernel-append-localversion=${NAME}
#	--no-clean
#	--no-mrproper
#	--module-rebuild
#	--install
#	--all-ramdisk-modules
#	--color
#	all

cd /usr/src/linux
# To automatically select modules you can use any of allnoconfig, allyesconfig, allmodconfig, localnoconfig, localyesconfig or localmodconfig 
# NAME="localmodconfig"
# make  localmodconfig
# genkernel --kernel-config=/usr/src/linux/.config_${NAME} --kernel-append-localversion=_${NAME} --no-clean --no-save-config --module-rebuild --install --all-ramdisk-modules --color all
genkernel --kernel-config=/usr/src/.config_old --no-clean --no-mrproper --color --menuconfig all

rm /usr/src/.config_old
