#!/bin/bash
chroot /mnt/gentoo /bin/bash
source /etc/profile
export PS1="(chroot) ${PS1}"

# add root user
# add fstab
# systemctl daemon-reload # refresh fstab
mount /boot
mount /home

# Ramdrive for builds and also to prevent SSD wear (Portage uses the /var/tmp/portage directory).
mount -t tmpfs -o size=8G tmpfs  /tmp
mount -t tmpfs -o size=8G tmpfs  /var/tmp

# emerge-webrsync
emerge --sync

emerge --ask --quiet-build --keep-going --emptytree @world
emerge --ask --quiet-build --keep-going @preserved-rebuild
emerge --ask --depclean
emerge --ask --quiet-build --keep-going --noreplace sys-kernel/gentoo-kernel-bin networkmanager

systemctl enable NetworkManager --now
systemctl --user enable pulseaudio.service --now

# To be used along /etc/profile.d/xdg_cache_home.sh to prevent SSD wear (https://wiki.gentoo.org/wiki/SSD)
emerge --ask www-misc/profile-sync-daemon
systemctl --user enable --now psd

emerge --ask --quiet-build --keep-going --noreplace app-text/texlive gnome-base/gnome gnome-base/gvfs app-misc/ddccontrol app-misc/g810-led app-misc/piper media-fonts/corefonts media-fonts/fontawesome media-fonts/fonts-meta media-fonts/noto media-fonts/terminus-font media-plugins/gst-plugins-meta sys-libs/gpm sys-process/iotop sys-process/lsof www-misc/profile-sync-daemon x11-libs/libxcb app-editors/texworks mail-client/thunderbird www-client/firefox app-editors/vscode app-office/libreoffice media-video/vlc net-im/slack net-im/telegram-desktop media-sound/audacity media-sound/puddletag media-video/shotcut media-video/subtitleeditor app-editors/gedit-plugins net-p2p/transmission sys-block/gparted gnome-extra/gnome-browser-connector mail-client/thunderbird media-gfx/gimp media-gfx/gimp-arrow-brushes media-gfx/gthumb media-gfx/imagemagick media-plugins/gimp-lqr dev-texlive/texlive-fontsextra dev-util/meld dev-util/pycharm-community games-util/joystick dev-debug/gdb media-gfx/inkscape media-sound/quodlibet x11-drivers/nvidia-drivers net-im/telegram-desktop media-video/shotcut media-video/subtitleeditor app-office/libreoffice app-editors/gedit-plugins media-plugins/gimp-lqr gnome-base/gnome-extra-apps media-sound/alsa-utils
emerge --ask --quiet-build --keep-going gnome-extra/nautilus-dropbox dev-lang/spidermonkey
emerge --ask --quiet-build --keep-going sys-kernel/genkernel sys-kernel/gentoo-sources
