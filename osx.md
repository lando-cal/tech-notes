1.  Firewall - 10.11

From
<http://krypted.com/mac-security/command-line-firewall-management-in-os-x-10-10/>
- /usr/libexec/ApplicationFirewall/socketfilterfw Mac OS X rules.

See a long list of [OS X Commands](OS_X_Commands "wikilink")

10.9
----

10.8
----

### Nifty Commands

-   [pgrep](pgrep "wikilink")
-   [pkill](pkill "wikilink")
-   [serverinfo](serverinfo "wikilink")
-   [caffeinate](caffeinate "wikilink")
-   [sharing](sharing "wikilink")
-   [tccutil](tccutil "wikilink")
-   [scutil](scutil "wikilink")

Tricks
------

### Install package from CLI

`sudo installer -pkg /Volumes/ExifTool-9.16/ExifTool-9.16.pkg -target /`\

### Start FTP server

`sudo -s `[`launchctl`](launchctl "wikilink")` load -w /System/Library/LaunchDaemons/ftp.plist`

### Check swap usage

`sysctl vm.swapusage`

### Disable wifi disconnect when locking screen

`sudo /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources airport en1 prefs DisconnectOnLogout=NO`

### Show some downloaded files

This shows a list of all the quarantine checked downloads:

`sqlite3 ~/Library/Preferences/com.apple.LaunchServices.QuarantineEventsV* 'select distinct LSQuarantineDataURLString from LSQuarantineEvent'`

### Send Notifications from Terminal

`sudo gem install terminal-notifier`\
`terminal-notifier -message "Hello, this is my message" -title "Message Title"`

### Enable verbose eap logging

`sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.eapolclient LogFlags -int -1`

Network
-------

-   gif0 - Generic Tunnel Interface. See \`man gif\`.
-   stf0 - Six To Four tunnel.

Migration
---------

After migrating, check these files:

-   /etc/hosts (not transferred using Migration Assistant in 10.7)
-   crontabs (not transferred using Migration Assistant in 10.7)
-   /etc/apache2/httpd.conf (not transferred using Migration Assistant
    in 10.7)

Essential Software
------------------

-   [Adium](Adium "wikilink") - Multi-protocol chat client
-   [Bonjour Browser](Bonjour_Browser "wikilink") -
    [Bonjour](Bonjour "wikilink") service listing
-   [Camino](Camino "wikilink") - A Mozilla based web browser made in
    [Cocoa](Cocoa "wikilink"), very similar to
    [Firefox](Firefox "wikilink").
-   [coconutBattery](coconutBattery "wikilink") - Tracks battery health
-   [DNSUpdate](DNSUpdate "wikilink") - [Dyndns](Dyndns "wikilink")
    daemon
-   [EvoCam](EvoCam "wikilink") - Webcam software for posting images and
    making vids
-   [Flip4Mac](Flip4Mac "wikilink") - [WMV](WMV "wikilink") codecs for
    [Quicktime](Quicktime "wikilink")
-   [fseventer](fseventer "wikilink") -
    [Spotlight](Spotlight "wikilink") powered filesystem access monitor
-   [Fugu](Fugu "wikilink") - [SFTP](SFTP "wikilink") client
-   [GeekTool](GeekTool "wikilink") - Present shell scripts and output
    status on the desktop
-   [Google Earth](Google_Earth "wikilink") - 3D earth browser
-   [Growl](Growl "wikilink") - Unified application notification tool
-   [Handbrake](Handbrake "wikilink") - [DVD](DVD "wikilink") to
    [MP4](MP4 "wikilink") and [AVI](AVI "wikilink")
-   [iClipLite](iClipLite "wikilink") - Clipboard recording and storage
-   [Key Codes](Key_Codes "wikilink") - Shows key codes for different
    keys on the keyboard
-   [Lingon](Lingon "wikilink") - GUI modifications for
    [launchd](launchd "wikilink")
-   [Lostify](Lostify "wikilink") - Metadata editor for
    [MP4](MP4 "wikilink") files.
-   [Nicecast](Nicecast "wikilink") - Front-end wrapper for
    [Icecast](Icecast "wikilink") streaming audio server.
-   [ObservationPost](ObservationPost "wikilink") - Monitors status
    changes in hardware, network and apps.
-   [osx2x](osx2x "wikilink") - keyboard and mouse sharing via
    [VNC](VNC "wikilink").
-   [Perian](Perian "wikilink") - [Quicktime](Quicktime "wikilink")
    codecs like [Divx](Divx "wikilink").
-   [Quicksilver](Quicksilver "wikilink") - THE app launcher
-   [Skype](Skype "wikilink") - P2P VOIP
-   [smcFanControl](smcFanControl "wikilink") - Control the speed of the
    fans inside your Mac.
-   [The Unarchiver](The_Unarchiver "wikilink") - GUI handling of many
    many archive formats including the nemesis, Stuffit.
-   [Vine Server](Vine_Server "wikilink") - The best
    [VNC](VNC "wikilink") server for OS X.
-   [VLC](VLC "wikilink") - The most versatile media player for
    any platform.

<Category:Apple> <Category:Nix>
