#!/usr/bin/env bash
set -oue pipefail

dnf -y distro-sync \
	ffmpeg \
	libheif \
	libva \
	mesa-filesystem \
	mesa-dri-drivers \
	mesa-va-drivers \
	mesa-vulkan-drivers \
	pipewire-libs-extra \
	x264-libs \
	x265-libs
