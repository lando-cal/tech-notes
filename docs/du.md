"estimate file space usage" - `man du`

# Examples

## Summarize low level directory uage

When a partition fills up this is a good place to begin looking. Some flags may not be available, such as `sort -h`

```
# -x      --one-file-system
# -d 3    --max-depth=3
# -h      --human-readable
sudo du -x -d 3 -h / | sort -h
```
