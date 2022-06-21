#!/bin/bash

if [ $(id -u) -ne 0 ]
  then echo "Please run with sudo"
  exit
fi

set -e

sed -i s"/^GRUB_TIMEOUT=.*$/GRUB_TIMEOUT=-1" /etc/default/grub
sed -i s"/^GRUB_TIMEOUT_STYLE=.*$/GRUB_TIMEOUT_STYLE=menu" /etc/default/grub

update-grub
