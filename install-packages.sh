#!/bin/bash

if [ $(id -u) -ne 0 ]
  then echo "Please run with sudo"
  exit
fi

set -e

apt update && apt upgrade

apt install build-essential initramfs-tools debconf-utils dpkg-dev debhelper bin86 fakeroot kernel-package pkg-config libssl-dev zstd bison flex libnuma-dev libcap-dev libelf-dev libbfd-dev gcc clang llvm zlib1g-dev python-is-python3 dwarves default-jdk clang-12 apt-transport-https curl gnupg git python3-pip
