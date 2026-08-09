#!/usr/bin/env bash
set -euo pipefail

BUILD_DEPS=(
	git
	cmake
	gcc-c++
	extra-cmake-modules
	qt6-qtbase-devel
	qt6-qtbase-private-devel
	kf6-ki18n-devel
	kwin-devel
	kf6-kconfig-devel
	kf6-kcoreaddons-devel
	kf6-kglobalaccel-devel
	kf6-kiconthemes-devel
	kf6-kpackage-devel
	kf6-kwindowsystem-devel
	kf6-kcolorscheme-devel
	kf6-kcmutils-devel
	kf6-kconfigwidgets-devel
	kf6-kdeclarative-devel
	kf6-kguiaddons-devel
	kf6-kio-devel
	kf6-kservice-devel
	kf6-ktextwidgets-devel
	kf6-kxmlgui-devel
	kdecoration-devel
	libepoxy-devel
	wayland-devel
	libdrm-devel
)

WORKDIR="$(mktemp -d)"

cleanup() {
	local status=$?
	rm -rf "${WORKDIR}"
	echo "==> Removing build dependencies"
	dnf remove -y "${BUILD_DEPS[@]}" || true
	exit "${status}"
}
trap cleanup EXIT

echo "===[ INSTALLING KDE EXTRAS ]==="
echo "==> Installing build dependencies"
dnf install -y "${BUILD_DEPS[@]}"

echo "==> Building material-decoration"
git clone --depth 1 https://github.com/guiodic/material-decoration.git "${WORKDIR}/material-decoration"
cmake -B "${WORKDIR}/material-decoration/build" -S "${WORKDIR}/material-decoration"
cmake --build "${WORKDIR}/material-decoration/build" -j"$(nproc)"
cmake --install "${WORKDIR}/material-decoration/build"

echo "==> Building KDE-Rounded-Corners"
git clone --depth 1 https://github.com/matinlotfali/KDE-Rounded-Corners "${WORKDIR}/kde-rounded"
cmake -B "${WORKDIR}/kde-rounded/build" -S "${WORKDIR}/kde-rounded"
cmake --build "${WORKDIR}/kde-rounded/build" -j"$(nproc)"
cmake --install "${WORKDIR}/kde-rounded/build"
