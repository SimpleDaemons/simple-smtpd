#!/bin/bash
# Post-uninstallation script for simple-smtpd RPM

set -e

# Reload systemd
systemctl daemon-reload

exit 0

