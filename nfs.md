[nfs](nfs "wikilink") is the Network File System.
- Configured in [linux](linux "wikilink") at /etc/exports
- Great info here: [http://nfs.sourceforge.net/](http://nfs.sourceforge.net/)

# Tips and Tricks
## Regarding mount points within shares
If you have a mount point within an NFS share, you must have a separate entry in your exports file that sets the permissions of this mount point. Currently OS X has a problem with this, but officially this is the way to do it.

## Show hosts that are connected to this NFS server
`showmount`

## Show what hosts are using what exports
`showmount -a`

## Show exported directories
[`showmount`](showmount "wikilink")`-e`

## Show directories in use by NFS
`showmount -d`

## Add an NFS mount to fstab
`opal:/z4  /mnt/z4   nfs  rsize=8192,wsize=8192,timeo=14,intr`

# Linux Tips and Tricks
## Show which versions of NFS your NFS server supports
`rpcinfo -p`

# OS X Tips and Tricks
## Create persistent NFS mount in OS X 10.8

```
sudo mkdir /mnt # OS X doesn't like you playing with /Volumes, it may delete your dirs
sudo dscl . -create /Mounts/z4
sudo dscl . -create /Mounts/z4 VFSLinkDir /mnt/z4
sudo dscl . -create /Mounts/z4 VFSOpts resvport rw nosuid
sudo dscl . -create /Mounts/z4 VFSType nfs
sudo dscl . -create /Mounts/z4 RecordName opal:/z4
sudo dscl . -create /Mounts/iTunes
sudo dscl . -create /Mounts/iTunes VFSLinkDir /mnt/z4/iTunes
sudo dscl . -create /Mounts/iTunes VFSOpts resvport rw nosuid
sudo dscl . -create /Mounts/iTunes VFSType nfs
sudo dscl . -create /Mounts/iTunes RecordName opal:/z4/iTunes
sudo dscl . -read /Mounts/opal:/z4
sudo dscl . -read /Mounts/opal:/z4/iTunes
sudo dscl . -list /Mounts

sudo dscl . -delete /Mounts opal:/z4/iTunes
```

<Category:Nix> <Category:Network>
