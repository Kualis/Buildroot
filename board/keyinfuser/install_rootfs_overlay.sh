#!/bin/sh

echo " "
echo "---------------------------------------------------------------------------------------------------"
echo " INSTALL rootfs overlay "
echo " "

# First we kill the KI processes or services 
echo " "
echo "--------------------------------------------------"
echo " 1) Stop services "
echo " "
/root/stop_services.sh

# Second let's extract the tar.gz
echo " "
echo "--------------------------------------------------"
echo " 2) Extraction of /root/$1 in / "
bsdtar -xpf /root/$1 -C /

# Third rm the tar.gz
echo " "
echo "--------------------------------------------------"
echo " 3) Remove the tar.gz "
echo " "
rm /root/KI_*.tar.gz

