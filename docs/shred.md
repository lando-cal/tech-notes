Title: Shred

"shred - overwrite a file to hide its contents, and optionally delete it." - `man shred`

# Examples

## Write random data to a hard disk 5 times, then once with zeroes

`shred -n 5 -z /dev/disk/by-id/usb-Seagate_External_2HC015KJ-0:0`

## Write zeroes to a disk 5 times and report progress

```
for _ in {1..5} ; do shred -n 0 -z -v /dev/disk/by-id/usb-Seagate_External_2HC015KJ-0:0 ; done ;
```
