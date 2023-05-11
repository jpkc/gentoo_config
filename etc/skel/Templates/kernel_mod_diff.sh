#!/bin/bash

uname -a > experimental_usb.txt
uname -a > experimental_pci.txt
uname -a > experimental_mod.txt
lsusb >> experimental_usb.txt
lspci >> experimental_pci.txt
lsmod >> experimental_mod.txt

meld experimental_usb.txt gentoo-dist_usb.txt
meld experimental_pci.txt gentoo-dist_pci.txt
meld experimental_mod.txt gentoo-dist_mod.txt

