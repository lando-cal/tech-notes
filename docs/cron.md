Title: cron

Per-user and system-wide scheduled tasks, handled by the cron daemon.

# Locations
Cron scripts and entries can run from several locations.  By using /etc/crontab.d/scriptname you can set different MAILTO and ENV variables and isolate your scheduled jobs. User jobs can be edited via `crontab -e`.

# DST
Some cron daemons don't handle DST correctly.  Because of this, do not schedule jobs within the our of 1am.  During DST changes this hour happens twice or is skipped altogether.

Cronie says it handled DST gracefully, running jobs that should have run but haven't yet due to time changes, or no running jobs twice when time goes back.

# Syntax quirks
Some systems have problems with #/# syntax.  (eg: `15 2/6 * * * /usr/bin/whatever`)

# Default Editor
In some systems, the default editor is found by the symlink located at /etc/defaults/editor.  To override this, export your EDITOR shell variable. (eg: `export EDITOR=/usr/bin/vim`)

# Examples
## Quick and dirty realignment
This will definitely fail in some circumstances.

```
alias crontab-align='crontab -l | while read -r a b c d e f ; do
  if [[ "$a" =~ ^## ]] ; then
    echo "$a $b $c $d $e $f" ;
  else
    printf "% -20s %s\n" "$a $b $c $d $e" "$f" ;
  fi ;
done'

crontab-align | crontab -
```

## Add a random delay
This example sleeps for a random number of seconds lower than 1800, including 0.  The `%` symbol has to be escaped in crontabs.

```
0 * * * *   sleep $((RANDOM \% 1800)) ; /usr/local/bin/do-a-thing.sh ;
```

## Programmatic editing of the crontab
This is potentially dangerous because you can wipe out a user's crontab.

```
crontab -l | sed -e '/downtime/s/^\#//' | crontab -
echo "* * * * * /usr/local/bin/every_minute.sh" | crontab -
```

## See if and when parts are running
Put this in /etc/cron.*/01-cron-log :

```
logger -t cron Running `basename $PWD`
```

## OS X Alarm Clock

```
## Alarm Clock
55 5 * * 1-5    /usr/bin/osascript -e 'tell application "iTunes"' -e 'set the sound volume to 100' -e 'end tell'
00 6 * * 1-5    /usr/bin/osascript -e 'tell application "iTunes"' -e 'play playlist "Old Podcasts"' -e 'end tell'
15 8 * * 1-5    /usr/bin/osascript -e 'tell application "iTunes" to stop'
```

## Curl every other hour

```
0 */2 * * *    curl -fs "http://bighugelabs.com/flickr/profilewidget/randomint/000000/ffffff/94246031@N00.jpg" > /dev/null
```

# Troubleshooting

Having junk files like temp vim files in /var/cron/tabs can make cron go to 100% cpu usage.  Remove all non crontab files and kill cron to fix it.

# Links

- <https://crontab.guru/> - Online crontab linter and explainer
