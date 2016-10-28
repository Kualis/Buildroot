#!/bin/sh

echo -e "\nPermitRootLogin yes" >>  "${TARGET_DIR}/etc/ssh/sshd_config"
echo -e "\nauto eth0\niface eth0 inet dhcp" >> "${TARGET_DIR}/etc/network/interfaces"
