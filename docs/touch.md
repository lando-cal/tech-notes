`touch` is a command to modify the date of filesystem metadata for a given file.

# Examples

## Create an empty file

`touch somefile`

## Randomize the mtime for a given file

bash's random only goes up to 32767, so this only randomizes within the last ~9 hours.

`touch -t $(gdate -d @$(( $(date +%s) - RANDOM)) "+%Y%m%d%H%M.%S") somefile`
