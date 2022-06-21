#!/bin/bash

# This script can be used to install a linux-5.11.0 based ghOSt kernel on an Ubuntu 20.04 machine.

if [ $(id -u) -ne 0 ]
  then echo "Please run with sudo"
  exit
fi

set -e

rm -rf build_kernel
mkdir build_kernel
cd build_kernel

# Somehow the directory name plays a crucial role later on.
git clone --branch "ghost-v5.11" --depth 1 https://github.com/google/ghost-kernel.git linux-5.11.0_5.11.0

cd linux-5.11.0_5.11.0

make olddefconfig

# Clear keys that we are not able to produce
scripts/config -d CONFIG_SYSTEM_TRUSTED_KEYS -d CONFIG_SYSTEM_REVOCATION_KEYS
# Enable ghOSt
scripts/config -e CONFIG_SCHED_CLASS_GHOST

make olddefconfig

make bindeb-pkg -j$(nproc)

dpkg -i ../linux-image-5.11.0+_*.deb

make -j$(nproc) headers_install INSTALL_HDR_PATH=/usr
