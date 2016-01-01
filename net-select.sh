#!/bin/bash
#
# net-select.sh 
#
# scans then searches for network name, selects network ESSID
# !!! requires user input !!!
#
# usage: ./net-select.sh "<network name query>"
# ex: ./net-select.sh "myNetwork"
#

shopt -s nocasematch # Set shell to ignore case
shopt -s extglob # For non-interactive shell.

readonly TARGETNET_QUERY=$1
readonly SPC="&nbsp;"
TARGETNET_NAME=""
TARGETNET_SSID=""
sudo iwlist wlan0 scan | bash iwlist-format.sh | grep $TARGETNET_QUERY

echo -n "Choose target network (1 or 2, etc):"
read option
    if [ "$option" == "1" ]; then
        TARGETNET_NAME=$(sudo iwlist wlan0 scan | bash iwlist-format.sh | grep $TARGETNET_QUERY | sed -n 1p | awk "{print $2}")
        TARGETNET_SSID=$(sudo iwlist wlan0 scan | bash iwlist-format.sh | grep $TARGETNET_QUERY | sed -n 1p | awk "{print $1}")
    elif [ "$option" == "2" ]; then
        TARGETNET_NAME=$(sudo iwlist wlan0 scan | bash iwlist-format.sh | grep $TARGETNET_QUERY | sed -n 2p | awk "{print $2}")
         TARGETNET_SSID=$(sudo iwlist wlan0 scan | bash iwlist-format.sh | grep $TARGETNET_QUERY | sed -n 2p | awk "{print $1}")
    else
        echo "no fuego" 
fi
echo $TARGETNET_NAME$("&nbsp;")$TARGETNET_SSID