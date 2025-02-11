#!/bin/bash

DEVICE_NAME="DELL0B25:00 06CB:CE26 Touchpad"
DEVICE_ID=$(xinput list --id-only "$DEVICE_NAME" 2>/dev/null)

echo "$DEVICE_ID"

