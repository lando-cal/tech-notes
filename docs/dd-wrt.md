# Netgear R7000

- <https://www.myopenrouter.com/downloads/dd-wrt-r7000>
- <http://www.desipro.de/ddwrt/K3-AC-Arm/>

## Restart script

This device with dd-wrt has caused me so much trouble I have to monitor it and reboot it when it fails. Here is a short script to do that. I have this set up in cron to run every 5 minutes. The router will not reboot unless it's been up for 10 minutes.

```
fping -q google.com || {
  date '+%F %T%z Router is locked up. Restarting it.' | tee -a "${HOME}/router_reboot.log"
  ssh root@192.168.1.1 'set -x ; uptime ; awk "int(\$1) < 600 { exit 1 }" /proc/uptime && reboot ;' | tee -a "${HOME}/router_reboot.log"
}
```

## Version notes

### 2015-12-24 v3.0-r28598 kongac

- Cannot edit DHCP reservations. Only can push and pop from the list, but cannot edit the added entries.

### 2015-12-03 v3.0-r28600M kongac

- No observed differences from v3.0-r28598

### 2017-01-18 v3.0-r31160M kongac

- General instability. Periodic lockups requiring power cycle to fix.
- Potential weirdness playing with other wifi access points, unable to roam from this to Airport AC as I used to.

### 2017-03-10 v3.0-r31520M kongac

- <http://www.dd-wrt.com/phpBB2/viewtopic.php?p=1071890>
- Installed 2017-03-20
- Experienced hard lock within 24 hours, had to power cycle to fix. Found posts in dd-wrt forum about other folks experiencing the same issue.

### 2017-03-26 v3.0-r31575M kongac

- Installed on 2017-03-21
- Appears to have fixed the hard lock-ups

### 2017-03-26 v3.0-r31780M kongac

- Installed on 2017-03-31 via `ddup --flash-latest`. First attempt failed. Rebooted, and second attempt worked.
- Never had any problems with this

### 2017-03-31 v3.0-r31800M kongac

- Installed on 2017-04-01
- 1 router lockup 3 days after installation
- 2 router lockups on day 4

### 2017-04-08 v3.0-r31830M kongac

- Installed on 2017-04-07
- Locked up after 10 days

### 2017-04-16 v3.0-r31870M kongac

- Installed on 2017-04-17
- Router locked up after 4 days

### 2017-04-30 v3.0-r31920M kongac

- Installed on 2017-05-02
- Had periodic lockups

### 2017-05-11 v3.0-r31980M kongac

- Installed on 2017-05-14
- Experienced wifi problem, dhcp problem, and routing problems within 24 hours
- Experienced the same problems within 12 hours after reboot
- Uptime peak is 9 days

### 2017-06-03 v3.0-r32170M kongac

- Installed on 2017-06-08
- Sometimes wireless clients are unable to connect to the network.
- Sometimes the router becomes inaccessable to clients even though it is still up.

### 2017-08-02 DD-WRT v3.0-r33000M kongac

- Installed on 2017-08-05
- Quite stable

### 2017-10-22 DD-WRT v3.0-r33575M kongac

- Installed on 2017-10-22
- Seeing lock-ups and wifi unavailability after 24 hours
- Seeing more lock-ups and wifi unavailability hours after restart

### 2017-11-03 DD-WRT v3.0-r33655M kongac

- Installed on 2017-11-04
- WiFi instability observed within hours

### 2017-11-03 DD-WRT v3.0-r33675M kongac

- 2017-12-25: Discovered this firmware had been installed

### 2018-01-03 DD-WRT v3.0-r34320M kongac (c) 2017 NewMedia-NET GmbH

- Installed on 2018-01-16
- DD-WRT v3.0-r34320M kongac (c) 2017 NewMedia-NET GmbH
- Release: 01/03/18
- http://www.desipro.de/ddwrt/K3-AC-Arm/TEST/dd-wrt.v24-K3_AC_ARM_STD.bin
- Frequent lock-ups

### 2018-02-11 DD-WRT v3.0-r34900M kongac (c) 2018 NewMedia-NET GmbH

- Installed on 2018-02-16
- DD-WRT v3.0-r34900M kongac (c) 2018 NewMedia-NET GmbH
- Release: 02/11/18
- Very unstable wifi

### 2018-02-19 DD-WRT v3.0-r35030M kongac (c) 2018 NewMedia-NET GmbH

- Installed on 2018-02-24 (?)
- DD-WRT v3.0-r35030M kongac (c) 2018 NewMedia-NET GmbH
- Release: 02/19/18
