Title: Apple APFS

Notes here are current as of macOS 10.13, and don't apply specifically to any other devices that run APFS.

# Usage

```
$ diskutil apfs
2017-11-04 18:23:55-0700
Usage:  diskutil [quiet] ap[fs] <verb> <options>
        where <verb> is as follows:

     list                (Show status of all current APFS Containers)
     convert             (Nondestructively convert from HFS to APFS)
     create              (Create a new APFS Container with one APFS Volume)
     createContainer     (Create a new empty APFS Container)
     deleteContainer     (Delete an APFS Container and reformat disks to HFS)
     resizeContainer     (Resize an APFS Container and its disk space usage)
     addVolume           (Export a new APFS Volume from an APFS Container)
     deleteVolume        (Remove an APFS Volume from its APFS Container)
     eraseVolume         (Erase contents of, but keep, an APFS Volume)
     changeVolumeRole    (Change the Role metadata bits of an APFS Volume)
     unlockVolume        (Unlock an encrypted APFS Volume which is locked)
     lockVolume          (Lock an encrypted APFS Volume (diskutil unmount))
     listCryptoUsers     (List cryptographic users of encrypted APFS Volume)
     changePassphrase    (Change the passphrase of a cryptographic user)
     setPassphraseHint   (Set or clear passphrase hint of a cryptographic user)
     encryptVolume       (Start async encryption of an unencrypted APFS Volume)
     decryptVolume       (Start async decryption of an encrypted APFS Volume)
     updatePreboot       (Update the APFS Volume's related APFS Preboot Volume)

diskutil apfs <verb> with no options will provide help on that verb
```

# File clones

APFS supports deduplicated file copies, which it calls clonefiles. Copying a file by option-dragging it in Finder creates a clonefile. To create a clonefile on the CLI use `cp -c src dst`. Creating clonefiless of any size file is instantaneous because no file data is actually being copied. This differs from hard links because if you modify the clone, only the new blocks will be written to disk, and the source of the cloned file will not be modified.

# Snapshots

Snapshots appear to be tied pretty directly to Time Machine, and do not appear to be general purpose. There appear to be many limitations in how they can be used, and what information you can get about them.

There was previously a tool called `apfs_snapshot` but it was removed before macOS 10.13 was released.

## Create a snapshot

You cannot choose a name for your snapshot, it is tied to the date the snapshot was taken in the form of YYYY-MM-DD-HHMMSS.

```
$ sudo tmutil localsnapshot
Created local snapshot with date: 2017-11-04-183728
```

## Show snapshots

```
$ sudo tmutil listlocalsnapshots /
com.apple.TimeMachine.2017-11-01-161748
com.apple.TimeMachine.2017-11-02-100755
com.apple.TimeMachine.2017-11-03-084837
com.apple.TimeMachine.2017-11-04-182813
```

## Mount a snapshot

```
$ mkdir snap_test
$ sudo mount_apfs -s com.apple.TimeMachine.2017-11-04-192829 / "${PWD}/snap_test"
```

## Delete a snapshot

You can only delete snapshots based off of their date.

```
$ sudo tmutil deletelocalsnapshots 2017-11-04-183813
Deleted local snapshot '2017-11-04-183813'
```

## Delete all snapshots

```
/usr/bin/tmutil listlocalsnapshots / | while read -r X ; do
  tmutil deletelocalsnapshots "${X##*.}"
done
```

## Thin out snapshots

On the given drive, reclaim the given space by thinning out snapshots. As of tmutil 4.0.0, you cannot use any data unit other than bytes. (EG: 1G or 1GB will not work)

```
$ sudo tmutil thinlocalsnapshots / 250000000
Thinned local snapshots:
2017-11-04-184425
2017-11-04-184433
2017-11-04-184440
```

# See also

```
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs.util
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs_invert
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs_preflight_converter
/System/Library/Filesystems/apfs.fs/Contents/Resources/apfs_stats
```

# Links
- [Apple File System](https://en.wikipedia.org/wiki/Apple_File_System)
- [Rich Trouton - Storing our digital lives - Mac filesystems from MFS to APFS](https://youtu.be/VUXUECpIGR0)
- [Apple File System Guide](https://developer.apple.com/library/content/documentation/FileManagement/Conceptual/APFS_Guide/Introduction/Introduction.html)
- [Russ Bishop - Apple File System](http://www.russbishop.net/apple-file-system)
