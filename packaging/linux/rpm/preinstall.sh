#!/bin/bash
# Pre-installation script for simple-smtpd RPM
# License acceptance check

set -e

PROJECT_NAME="simple-smtpd"

# Display license and require acceptance
echo "=========================================="
echo "simple-smtpd License Agreement"
echo "=========================================="
echo ""
cat /usr/share/doc/$simple-smtpd/LICENSE 2>/dev/null || \
    cat /usr/share/$simple-smtpd/LICENSE.txt 2>/dev/null || \
    echo "Please review the license at: https://github.com/simpledaemons/$simple-smtpd/blob/main/LICENSE"
echo ""
echo "By continuing, you agree to the terms of the license."
echo ""
read -p "Do you accept the license? [y/N]: " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "License not accepted. Installation cancelled."
    exit 1
fi

exit 0

