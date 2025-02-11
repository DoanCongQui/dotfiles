#!/bin/bash

DEVICE_NAME="DELL0B25:00 06CB:CE26 Touchpad"
DEVICE_ID=$(xinput list --id-only "$DEVICE_NAME" 2>/dev/null)

# On click
xinput set-prop $DEVICE_ID "libinput Tapping Enabled" 1

# On Scrolling
xinput set-prop $DEVICE_ID "libinput Natural Scrolling Enabled" 1

# Setup Speed
xinput set-prop $DEVICE_ID "libinput Accel Speed" 0.5

# Setup zoom 
# xinput set-prop $DEVICE_ID "libinput Scroll Method Enabled" 0, 1, 0



