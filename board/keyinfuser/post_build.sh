#!/bin/bash

append_if_not_present() {
    grep -x "$1" "$2" > /dev/null
    if [ "$?" -ne "0" ]; then
	echo "Patching $2";
        echo -e "\n$1" >> "$2";
    fi
}

append_if_not_present "PermitRootLogin yes"	"${TARGET_DIR}/etc/ssh/sshd_config"
append_if_not_present "auto eth0"		"${TARGET_DIR}/etc/network/interfaces"
append_if_not_present "iface eth0 inet dhcp"	"${TARGET_DIR}/etc/network/interfaces"

# Break the symlink between /var/tmp and /tmp for the timedatectl command
rm -f ${TARGET_DIR}/var/tmp
mkdir ${TARGET_DIR}/var/tmp
chmod 1777 ${TARGET_DIR}/var/tmp


# Add networkd service for starting eth0 at boot

append_if_not_present "[Match]\nname=eth0\n\n[Network]\nDHCP=yes\n"     "${TARGET_DIR}/etc/systemd/network/eth0.network"

# Add the PCA kernel module in modules-load.d directory
append_if_not_present "pwm_pca9685.conf\n"     "${TARGET_DIR}/etc/modules-load.d/pwm-pca9685.conf"

# Add the scripts which allow us to put the rootfs on the board
cp board/keyinfuser/install_rootfs_overlay.sh ${TARGET_DIR}/root/
cp board/keyinfuser/stop_services.sh ${TARGET_DIR}/root/
