#!/bin/bash
# Post-installation script for simple-smtpd RPM

set -e

PROJECT_NAME="simple-smtpd"
SERVICE_USER="smtpddev"

# Create service user if it doesn't exist
if ! id "$SERVICE_USER" &>/dev/null; then
    useradd -r -s /sbin/nologin -d /var/lib/$simple-smtpd -c "$simple-smtpd service user" "$SERVICE_USER"
fi

# Set ownership
chown -R "$SERVICE_USER:$SERVICE_USER" /etc/$simple-smtpd 2>/dev/null || true
chown -R "$SERVICE_USER:$SERVICE_USER" /var/log/$simple-smtpd 2>/dev/null || true
chown -R "$SERVICE_USER:$SERVICE_USER" /var/lib/$simple-smtpd 2>/dev/null || true

# Enable and start service
systemctl daemon-reload
systemctl enable "$simple-smtpd" 2>/dev/null || true
systemctl start "$simple-smtpd" 2>/dev/null || true

exit 0

