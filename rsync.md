Great way to sync one location to another, local or remote.  Note that this does not mean full synchronization, two commands with reversed source and destinations are required to accomplish that.

# Syntax Examples
## Giving additional ssh options

```
rsync -e 'ssh -o ConnectTimeout=10 -o PasswordAuthentication=no' -Rai /home target:/
```

## Exclude Filters
Exclude filters are kinda weird.
- They're case sensitive and there's no way to be case insensitive.
- They are relative to the root of the source URI. EG, `rsync --exclude="Desktop/" ~/ remotehost:~/`

Here is an example of what to use in --exclude-from=file.txt

```
**Cache
**Caches
**cache
**caches
**/.dropbox
**Previews.lrdata
**/Library/Application\ Support/Google/Chrome
```

## Long and Partial Transfers
If you're doing transfers which you'd like to monitor and risk being cut off, use this syntax:

`rsync -e ssh -az --partial --progress ./foo remotehost:~/bar/`

This will resume broken file transfers where they were left off, and give you completion statistics with transfer rate, percent complete and estimated time left.

## Recursively symlink src to dst
Slashes are really really important here; this won't work if you get them wrong. Absolute paths must be given, thus ${PWD} and ${HOME} vs ~

```
rsync -aP --link-dest="${PWD}/src" ./src/ dst #recursively symlink ./src to dst
```

This will create the directory `${HOME}/temp/some_dir` and hard link all the files from the source into the destination.  It should only take a few seconds.  Lines with 'hf' indicate a hard linked file.  Lines with 'cd' indicate 'created directory'.

```
rsync -aivv --link-dest="${HOME}/Dropbox" ${HOME}/Dropbox/some_dir ${HOME}/temp/
```

## Move files to another server in small batches
This is useful if you want to gradually clear up disk space rather than waiting until the end of a transfer of a large number of files to clear up disk space in one large operation.

```
while date ;
files=$(find /srv/backups/scribe/./ -type f -mtime +400 | head -n 500) ;
echo md5 of files ${#files} is $(echo ${files} | md5sum) ;
[ ! -z "${files}" ] ; do
  sudo rsync --bwlimit 20000 -RaPi --remove-source-files ${files} root@10.2.17.7:/srv/backups/scribe-sea/ ; echo sleeping ;
  sleep 10 ;
done ;
```

## Move all datestamped files older than the beginning of the previous month, excluding symlinks
This relies on gnu date, so use gdate if used on OS X.

```
rsync --remove-source-files -aPiv --bwlimit 20000 --exclude="**$(date -d "1 month ago" "+%Y-%m")**" --exclude="**$(date "+%Y-%m")**"  --no-links /srv/backups/scribe/* root@10.2.17.7:/srv/backups/scribe-sea/
```

## Reduce time precision during comparison
This is useful for rsyncing to FAT filesystems where time precision is 2 seconds.

```
rsync --modify-window=1 # allow 1 second of difference in timestamps
```

# See Also
- prsync
- pssh
- pscp
