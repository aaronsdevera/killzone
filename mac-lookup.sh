#!/bin/bash
#
# mac-lookup.sh 
#
# searches wireshark's vendor and manufacturer MAC address list
# parses for MAC and appends * character for all addresses in that code's range
#
# usage: ./mac-lookup.sh "<vendor>"
# ex: ./mac-lookup.sh "huawei"
#
# note: manual enumeration increases attack accuracy. beware MAC randomization

shopt -s nocasematch # Set shell to ignore case
shopt -s extglob # For non-interactive shell.

readonly VENDOR_QUERY=$1

### Print MAC vendor lookup
######### grep for Vendor in the command line argument
############### MAC column parse
####################### append * character 
cat mac-vendor-list.sh | grep $VENDOR_QUERY | awk '{print $1}' | sed 's/$/*/'
