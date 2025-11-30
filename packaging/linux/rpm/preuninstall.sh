#!/bin/bash
# Pre-uninstallation script for simple-smtpd RPM

set -e

PROJECT_NAME="simple-smtpd"

# Stop service before removal
if [ "$1" -eq 0 ]; then
    systemctl stop "$simple-smtpd" 2>/dev/null || true
    systemctl disable "$simple-smtpd" 2>/dev/null || true
fi

exit 0

