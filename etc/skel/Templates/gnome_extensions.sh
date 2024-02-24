#!/bin/bash
# Global:
	cd /usr/share/gnome-shell/extensions/
# Local:
	cd ~/.local/share/gnome-shell/extensions/
# Monitor config changes:
	$ dconf watch /
# Change value:
	$dconf write /org/gnome/shell/extensions/desk-changer/interval 900
	
