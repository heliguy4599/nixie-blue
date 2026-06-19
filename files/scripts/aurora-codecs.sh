#!/usr/bin/env bash
set -oue pipefail

dnf5 config-manager addrepo \
	--from-repofile="https://negativo17.org/repos/fedora-multimedia.repo"

dnf5 config-manager setopt fedora-multimedia.priority=90

dnf5 -y distro-sync \
	--repo=fedora-multimedia \
	mesa-filesystem \
	mesa-dri-drivers \
	mesa-va-drivers \
	mesa-vulkan-drivers \
	libva \
	libheif

dnf5 -y install \
	--repo=fedora-multimedia \
	ffmpeg \
	pipewire-libs-extra \
	x264-libs \
	x265-libs
