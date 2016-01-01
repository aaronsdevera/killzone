# killzone.sh
Tool to takedown malicious hosts on a network based on vendor code

## what it does
- launches persistant deauth attack on a target
- requires knowledge of target network and MAC address
- allows 3 command line argument for time between deauth attack (in seconds)

```
    usage: ./killzone.sh <target network BSSID> <target vendor MAC> <interface> <time to wait>
    ex: ./killzone.sh myNetwork evilHardware wlan0 0
```

# net-select.sh
- identifies a network's BSSID
- network enumeration tool

```
    usage: ./net-select.sh "<network name query>"
    ex: ./net-select.sh "myNetwork"
```

# mac-lookup.sh
- searches for MAC addresses given a vendor name
- appends * character for all addresses in that code's range
- target enumeration tool
- makes use of wireshark mac list in `mac-vendor-list.sh`

```
    usage: ./mac-lookup.sh "<vendor>"
    ex: ./mac-lookup.sh "huawei"
```

## notes
- manual enumeration increases attack accuracy
- beware MAC randomization
- requires linux box w/capable iface, arp-scan
- adapted from [dropkick.sh](http://julianoliver.com/output/log_2014-05-30_20-52) 
