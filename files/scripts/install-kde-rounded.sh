#!/usr/bin/env bash
set -oue pipefail

dnf install -y \
    git \
    cmake \
    gcc-c++ \
    extra-cmake-modules \
    kwin-devel \
    kf6-kconfigwidgets-devel \
    libepoxy-devel \
    kf6-kcmutils-devel \
    kf6-ki18n-devel \
    qt6-qtbase-private-devel \
    wayland-devel \
    libdrm-devel \

git clone https://github.com/matinlotfali/KDE-Rounded-Corners /tmp/kde-rounded
cd /tmp/kde-rounded
mkdir build
cd build
cmake ..
cmake --build . -j$(nproc)
make install

dnf remove -y \
    git \
    cmake \
    gcc-c++ \
    extra-cmake-modules \
    kwin-devel \
    kf6-kconfigwidgets-devel \
    libepoxy-devel \
    kf6-kcmutils-devel \
    kf6-ki18n-devel \
    qt6-qtbase-private-devel \
    wayland-devel \
    libdrm-devel \
