#!/bin/bash

# This script was created by Victor Miquel
# Its purpose is to install a 5.11.0 based ghOSt kernel, on an Ubuntu 20.04 machine.

if [ $(id -u) -ne 0 ]
  then echo "Please run with sudo"
  exit
fi

set -e

rm -rf build_kernel
mkdir build_kernel
cd build_kernel

apt update && apt upgrade

apt install build-essential initramfs-tools debconf-utils dpkg-dev debhelper bin86 fakeroot kernel-package pkg-config libssl-dev zstd bison flex libnuma-dev libcap-dev libelf-dev libbfd-dev gcc clang llvm zlib1g-dev python-is-python3 dwarves default-jdk clang-12 apt-transport-https curl gnupg git python3-pip

git clone https://github.com/google/ghost-kernel.git

# Somehow without this the install seems to fail on a real machine...
mv ghost-kernel linux-5.11.0_5.11.0

cd linux-5.11.0_5.11.0

make olddefconfig

# Clear keys that we are not able to produce
scripts/config -d CONFIG_SYSTEM_TRUSTED_KEYS -d CONFIG_SYSTEM_REVOCATION_KEYS
# Enable ghOSt
scripts/config -e CONFIG_SCHED_CLASS_GHOST

make olddefconfig

make bindeb-pkg -j$(nproc)

dpkg -i ../linux-image-5.11.0+_*.deb

reboot
