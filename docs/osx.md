Apple's Unix desktop operating system.

# Nifty Commands
- serverinfo
- caffeinate
- sharing
- tccutil
- scutil

# Firewall - 10.11
From [http://krypted.com/mac-security/command-line-firewall-management-in-os-x-10-10/](http://krypted.com/mac-security/command-line-firewall-management-in-os-x-10-10/)
- /usr/libexec/ApplicationFirewall/socketfilterfw

## Tricks
### Show hardware info

```
system_profiler SPHardwareDataType
```

### Install package from CLI

```
sudo installer -pkg /Volumes/ExifTool-9.16/ExifTool-9.16.pkg -target /
```

See also: <https://brew.sh/>

### Start FTP server

```
sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist
```

### Check swap usage

```
sysctl vm.swapusage
```

### Disable wifi disconnect when locking screen

```
sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources airport en1 prefs DisconnectOnLogout=NO
```

### Show some downloaded files
This shows a list of all the quarantine checked downloads:

```
sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select distinct LSQuarantineDataURLString from LSQuarantineEvent'
```

### Send Notifications from Terminal

```
sudo gem install terminal-notifier
terminal-notifier -message "Hello, this is my message" -title "Message Title"
```

### Enable verbose eap logging

```
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.eapolclient LogFlags -int -1
```

## Network
- gif0 - Generic Tunnel Interface. See `man gif`.
- stf0 - Six To Four tunnel.

## Migration
After migrating, check these files:
- /etc/hosts (not transferred using Migration Assistant in 10.7)
- crontabs (not transferred using Migration Assistant in 10.7)
- /etc/apache2/httpd.conf (not transferred using Migration Assistant
- in 10.7)
