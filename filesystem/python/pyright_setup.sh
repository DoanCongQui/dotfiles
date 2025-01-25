#!/bin/bash
# This script activates a specific Conda environment and then runs the given command.

# Ensure Conda is initialized in the current shell session
source ~/filesystem/python/venv/dq/bin/activate

# Run the provided command in the activated environment
exec "$@"

