# Netgear R7000

- <https://www.myopenrouter.com/downloads/dd-wrt-r7000>
- <http://www.desipro.de/ddwrt/K3-AC-Arm/>

## 2015-12-24 v3.0-r28598 kongac

- Cannot edit DHCP reservations. Only can push and pop from the list, but cannot edit the added entries.

## 2015-12-03 v3.0-r28600M kongac

- No observed differences from v3.0-r28598

## 2017-01-18 v3.0-r31160M kongac

- General instability. Periodic lockups requiring power cycle to fix.
- Potential weirdness playing with other wifi access points, unable to roam from this to Airport AC as I used to.

## 2017-03-10 v3.0-r31520M kongac

- <http://www.dd-wrt.com/phpBB2/viewtopic.php?p=1071890>
- Installed 2017-03-20
- Experienced hard lock within 24 hours, had to power cycle to fix. Found posts in dd-wrt forum about other folks experiencing the same issue.

## 2017-03-26 v3.0-r31575M kongac

- Installed on 2017-03-21 via `ddup --flash-latest`
- Appears to have fixed the hard lock-ups

## 2017-03-26 v3.0-r31780M kongac

- Installed on 2017-03-31 via `ddup --flash-latest`. First attempt failed. Rebooted, and second attempt worked.
- Never had any problems with this

## 2017-03-31 v3.0-r31800M kongac

- Installed on 2017-04-01 via `ddup --flash-latest`
- router lockup after 3 days
