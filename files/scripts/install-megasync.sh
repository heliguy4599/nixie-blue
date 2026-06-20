#!/usr/bin/env bash
set -euo pipefail

wget https://mega.nz/linux/repo/Fedora_44/x86_64/megasync-Fedora_44.x86_64.rpm
dnf install -y "./megasync-Fedora_44.x86_64.rpm"
