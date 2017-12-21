`touch` is a command to modify the date of filesystem metadata for a given file.

# Examples

## Create an empty file

`touch somefile`

## Randomize the mtime for a given file

bash's random only goes up to 32767, which is about 9 hours. With RANDOM * 32767 + RANDOM we can get this up to just over 34 years.

```
randomize-mtime() {
  seconds="$(( $(date +%s) - $(( RANDOM * 32767 )) - RANDOM))"
  new_mtime="$(gdate -d @"${seconds}" "+%Y%m%d%H%M.%S")"
  echo "${new_mtime} $*" 1>&2
  touch -t -m "${new_mtime}" "$@"
}

# change mtime of all files to the same random mtime
randomize-mtime test-foo{1..3} ;

# change mtime of each file to a different random mtime
for F in test-bar{1..3} ; do
  randomize-mtime "$F"
done
```
