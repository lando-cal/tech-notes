Title: split

"split - split a file into pieces" - `man split`

`split` is a common unix command.

# Usage Examples

## Split into DVD sized chunks

This example isn't practical, the size needs to be smaller than specified because of DVD filesystem overhead, so you should use 4700000000 or similar if you want to actually burn the data.

```
split -b 4707319808 source
```

## Split a big file and compress it with gzip before writing to disk

This is useful for splitting up large uncompressed logs. This command is background safe.

```
split -a4 --additional-suffix='-redis.log.1' -l500000 --filter='gzip -9 > $FILE.gz' redis.log.1
```

And if you want to see read stats, throw [pv](pv) in the mix:

```
$ split -a4 --additional-suffix='-redis.log.1' -l500000 --filter='pv | gzip -9 > $FILE.gz' redis.log.1
1.94GB 0:00:58 [21.2MB/s] [                                         <=>                              ]
```
