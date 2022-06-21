#!/bin/bash

if [ $(id -u) -ne 0 ]
  then echo "Please run with sudo"
  exit
fi

set -e

if [ $(dpkg-query -W -f='${Status}' bazel 2>/dev/null | grep -c "ok installed") -eq 0 ];
then
curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg
mv bazel-archive-keyring.gpg /usr/share/keyrings
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" | sudo tee /etc/apt/sources.list.d/bazel.list

apt update && apt install bazel
else
echo "Bazel already installed!"
fi
