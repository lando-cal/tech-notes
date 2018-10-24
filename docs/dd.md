title: Dd

Disk Dump, used for cloning disks, wiping data, copying blocks of data.

# Tips and Tricks

## Write random data

```
dd if=/dev/urandom of=/dev/hda
```

## Write zeros

```
dd if=/dev/zero of=/dev/hda
```

## Wipe a failed disk

If you can't use `shred` or `ddrescue`, this is a very slow but portable alternative

```
i=0
while true ; do
  echo "Writing block $i"
  dd if=/dev/zero of=/dev/sda count=1 bs=1 seek="$i"
  let i=i+1
done
```

## Wipe first and last 1G of a hard disk

```
dd bs=4096 if=/dev/zero of=/dev/sdx count=256 seek=$(( $(blockdev --getsz /dev/sdx) - 256))
```
