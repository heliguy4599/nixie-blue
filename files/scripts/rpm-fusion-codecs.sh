#!/usr/bin/env bash
set -oue pipefail

dnf swap -y ffmpeg-free ffmpeg --allowerasing
dnf install -y @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin
dnf install mesa-va-drivers-freeworld
dnf install mesa-va-drivers-freeworld.i686
