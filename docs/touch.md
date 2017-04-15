`touch` is a command to modify the date of filesystem metadata for a given file.

# Examples

## Create an empty file

`touch somefile`

## Randomize the mtime for a given file

bash's random only goes up to 32767, so this only randomizes within the last ~9 hours.

```
randomize-mtime() {
  touch -t "$(gdate -d @$(( $(date +%s) - RANDOM)) "+%Y%m%d%H%M.%S")" "$@"
}

# change mtime of all files to the same random mtime
randomize-mtime test-foo{1..3} ;

# change mtime of each file to a different random mtime
for F in test-bar{1..3} ; do
  randomize-mtime "$F"
done
```
