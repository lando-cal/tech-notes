"GNU ddrescue - Data recovery tool.  Copies data from one file or block device to another, trying to rescue the good parts first in case of read errors." – `man ddrescue`

There are actually two tools called ddrescue: dd_rescue and gddrescue.  gddrescue is the best.

- Software home page - <http://www.gnu.org/software/ddrescue/>
- Instruction Manual - <http://www.gnu.org/software/ddrescue/manual/ddrescue_manual.html>

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

# See Also

- [dcfldd](dcfldd)
- [dd](dd)
- [pv](pv)
