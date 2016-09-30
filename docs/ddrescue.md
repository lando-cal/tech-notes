ddrescue is a replacement for dd and dcfldd with a bunch of additional features.  There are actually two tools called ddrescue: dd_rescue and gddrescue.  gddrescue is the best.
- Software home page - [http://www.gnu.org/software/ddrescue/](http://www.gnu.org/software/ddrescue/)
- Instruction Manual - [http://www.gnu.org/software/ddrescue/manual/ddrescue_manual.html](http://www.gnu.org/software/ddrescue/manual/ddrescue_manual.html)

# Examples
## Attempt to mirror an entire hard disk

```
ddrescue -f -n --min-read-rate=500000 /dev/source_disk /dev/target_disk ~/ddrescue.log
```

## Attempt to continue the mirror of a hard disk

```
ddrescue -f -n -A /dev/source_disk /dev/target_disk ~/ddrescue.log
```

## Wipe the good sectors of a failing disk
This requires a valid rescue log file mapping out the good sectors that were recovered.

```
ddrescue --fill=+ --force /dev/zero /dev/bad_drive ~/bad_drive_wipe.log
```
