#!/bin/bash

# GTK Joystick test utility:
jstest-gtk

# Force Feedback test:
fftest /dev/input/event9


# g300 mouse: emerge --ask app-misc/piper
# More here: https://github.com/libratbag/piper
piper

# Logitech Unifying, Bolt, Lightspeed, or Nano: emerge --ask app-misc/solaar
# More Here: https://github.com/pwr-Solaar/Solaar


# G213 color: emerge --ask g810-led
# More here:
#     https://www.electricbrain.com.au/pages/linux-rgb-keyboard.php
#     https://wiki.ubuntuusers.de/g810-led/
#     https://github.com/MatMoul/g810-led
g213-led -a 00ff00




