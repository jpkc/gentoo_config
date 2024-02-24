#!/bin/bash

# Do a clean update.
#  Friendly Reminders:
#	$ equery depends ffmpeg
#	$ cat /proc/cmdline # Handy for mitigations=off check
#	$ grep . /sys/devices/system/cpu/vulnerabilities/*
#	$ ./spectre-meltdown-checker.sh --explain

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

# https://unix.stackexchange.com/questions/253245/what-does-make-localmodconfig-do
#	From the kernel README:
#		"make localmodconfig" Create a config based on current config and loaded modules (lsmod). Disables any module option that is not needed for the loadedmodules.
#
#	To create a localmodconfig for another machine, store the lsmod of that machine into a file and pass it in as a LSMOD parameter.
#		target$ lsmod > /tmp/mylsmod
#		target$ scp /tmp/mylsmod host:/tmp
#		host$ make LSMOD=/tmp/mylsmod localmodconfig
#		The above also works when cross compiling.
#
#		"make localyesconfig" Similar to localmodconfig, except it will convert all module options to built in (=y) options.
#
#	You need to make sure that all modules you will ever need are loaded at the point you run make localmodconfig.
#	One tool that can help to achieve this is https://github.com/graysky2/modprobed-db.
#
#	First, boot up a default distribution kernel and run /usr/bin/modprobed-db store periodically, or every time you connect some new piece of hardware.
#
#	Then, run sudo /usr/bin/modprobed-db recall which will load all the modules that were ever loaded when modprobe-db store was run, and now you do make localmodconfig.
#
# CONFIG_CMDLINE:
#	Kernel command line arguments string. Use this to hardcode a command line. It wil be APPENDED by the provided one.
#	To change the append behavior use  CMDLINE_OVERRIDE, CONFIG_CMDLINE_OVERWRITE or CONFIG_CMDLINE_EXTEND.
#	https://cateee.net/lkddb/web-lkddb/CMDLINE.html

