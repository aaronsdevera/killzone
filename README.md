# killzone.sh
Tool to takedown malicious hosts on a network based on vendor code

## what it does
- launches persistant deauth attack on a target
- requires knowledge of target network and MAC address
- allows 3 command line argument for time between deauth attack (in seconds)

```
    usage: ./killzone.sh <target network BSSID> <target vendor MAC> <time to wait>
    ex: ./killzone.sh myNetwork evilHardware 0
```

## notes
- manual enumeration increases attack accuracy
- beware MAC randomization
- requires linux box w/capable iface, arp-scan
- adapted from [dropkick.sh](http://julianoliver.com/output/log_2014-05-30_20-52) 