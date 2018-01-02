show filesystem metadata about a file

# GNU stat examples

## Show permissions, modify date, ownership and long filename

```
stat -c "%a/%A  %y %G(%g):%U(%u) %N" /srv/log/apache2/
```

## Sum file sizes

```
stat -c '%s' *2016* | awk '{sum += $1} END {print sum}'
```

# GNU stat -c variables

The valid format sequences for files (without --filesystem):

- %a - Access rights in octal
- %A - Access rights in human readable form
- %b - Number of blocks allocated (see %B)
- %B - The size in bytes of each block reported by %b
- %C - SELinux security context string
- %d - Device number in decimal
- %D - Device number in hex
- %f - Raw mode in hex
- %F - File type
- %g - Group ID of owner
- %G - Group name of owner
- %h - Number of hard links
- %i - Inode number
- %n - File name
- %N - Quoted file name with dereference if symbolic link
- %o - I/O block size
- %s - Total size, in bytes
- %t - Major device type in hex
- %T - Minor device type in hex
- %u - User ID of owner
- %U - User name of owner
- %x - Time of last access
- %X - Time of last access as seconds since Epoch
- %y - Time of last modification
- %Y - Time of last modification as seconds since Epoch
- %z - Time of last change
- %Z - Time of last change as seconds since Epoch Valid format sequences for file systems:
- %a - Free blocks available to non-superuser
- %b - Total data blocks in file system
- %c - Total file nodes in file system
- %d - Free file nodes in file system
- %f - Free blocks in file system
- %C - SELinux security context string
- %i - File System ID in hex
- %l - Maximum length of filenames
- %n - File name
- %s - Block size (for faster transfers)
- %S - Fundamental block size (for block counts)
- %t - Type in hex
- %T - Type in human readable form
