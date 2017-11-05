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

## Create a snapshot

`sudo tmutil localsnapshot`

## Show snapshots

`sudo tmutil listlocalsnapshots /`

## Delete a snapshot

You can only delete snapshots based off of their date

`sudo tmutil deletelocalsnapshots 2017-11-04-182713`

## Thin out snapshots

On the given drive, reclaim the given space by thinning out snapshots.

`sudo tmutil thinlocalsnapshots / 1G`

# Links
- [Apple File System](https://en.wikipedia.org/wiki/Apple_File_System)
- [Rich Trouton - Storing our digital lives - Mac filesystems from MFS to APFS](https://youtu.be/VUXUECpIGR0)
