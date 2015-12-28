Per-user and system-wide scheduled tasks, handled by the cron daemon.

## Locations

Cron scripts and entries can run from several locations.  By using /etc/crontab.d/scriptname you can set different MAILTO and ENV variables


## DST

Some cron daemons don't handle DST correctly.  Because of this, do not schedule jobs within the our of 1am.  During DST changes this hour happens twice or is skipped altogether.

* Cronie says it handled DST gracefully, running jobs that should have run but haven't yet due to time changes, or no running jobs twice when time goes back.

## Syntax

Some systems have problems with #/# syntax.  (eg:  "15 2/6 * * * /usr/bin/whatever")

## Default Editor

In some systems, the default editor is found by the symlink located at /etc/defaults/editor.  To override this, export your EDITOR shell variable.  (eg:  export EDITOR=/usr/bin/vim)

## Examples

### Quick and dirty realignment
This will definitely fail in some circumstances.

```
alias crontab-align='crontab -l | while read -r a b c d e f ; do if [[ "$a" =~ ^## ]] ; then echo "$a $b $c $d $e $f" ; else printf "% -20s %s\n" "$a $b $c $d $e" "$f" ; fi ; done'

crontab-align | crontab -
```


### Add a random delay
This example sleeps for a random number of seconds lower than 1800, including 0.  Spaces inside the (( and )) are necessary in order for this to work.
 0 * * * *   sleep $(( RANDOM \% 1800 )) ; /usr/bin/php /var/www/html/old-flixplor/reset_photo_date.php >> ~/log/reset_photo_date.log

### Programmatic editing of the crontab

 crontab -l | sed -e '/downtime/s/^\#//' | crontab -
 echo "* * * * * /bin/every_minute.sh" | crontab -

To see if and when things are running, put this in /etc/cron.*/01-cron-log : <tt>logger -t cron Running `basename $PWD`</tt>

### OS X Alarm Clock


```
## Alarm Clock
55 5 * * 1-5    /usr/bin/osascript -e 'tell application "iTunes"' -e 'set the sound volume to 100' -e 'end tell'
00 6 * * 1-5    /usr/bin/osascript -e 'tell application "iTunes"' -e 'play playlist "Old Podcasts"' -e 'end tell'
15 8 * * 1-5    /usr/bin/osascript -e 'tell application "iTunes" to stop'
```


### Curl every other hour


```
00 */2 * * *    curl -fs "http://bighugelabs.com/flickr/profilewidget/randomint/000000/ffffff/94246031@N00.jpg" > /dev/null
```


### Back up some OS X system settings


```
## Backup some system settings
3 2 * * *     /usr/bin/rsync -al /var/cron/tabs eustace:/Volumes/Peter/shasta/var/cron/ &> /dev/null
5 2 * * *     /usr/bin/rsync -al /etc/httpd eustace:/Volumes/Peter/shasta/etc/ &> /dev/null
```


### OS X System Tweaks


```
# Repair Permissions
30 7 * * *     /usr/sbin/diskutil repairPermissions / > /dev/null

# Download updates
15 8 * * *      /usr/sbin/softwareupdate -d -a > /dev/null

# Update darwinports
0 10 * * *       /opt/local/bin/port -q selfupdate

# Update locate database
10 17 * * *   /usr/libexec/locate.updatedb

# report uptime
0 0,12 * * *    /usr/bin/logger uptime `uptime`
```


### Open Xtorrent if it needs to download or seed


```
## Open Xtorrent in case we need seeding
0 1 * * 1-5	if ls ~/Library/Application\ Support/Xtorrent/TorrentCache/* 2> /dev/null > /dev/null  ; then /usr/bin/open /Applications/Xtorrent.app ; fi ;
```


## Troubleshooting

Having junk files like temp vim files in /var/cron/tabs can make cron go to 100% cpu usage.  Remove all non crontab files and kill cron to fix it.
