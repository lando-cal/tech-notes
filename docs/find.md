The `find` util letes you search a filesystem for things that match filesystem attributes. Unfortunately this is one of those tools where BSD and GNU deviate syntactically and featurewise, and GNU mostly wins.

# Examples

## Find and delete empty directories 2 levels deep or deeper

`find "${PWD}" -mindepth 2 -type d -empty -delete`

## Find based on a regex

`find /tank/movies -regextype egrep -iregex '.*\.(mov|mp4)$'`

## Find files and perform operations on them

One at a time:

`find "${PWD}" -type d -exec dot_clean {} \;`

Or several in batches, similar to how xargs handles things:

`find "${PWD}" -type d -exec dot_clean {} \+`

## Find files that match a glob

`find "${PWD}" -name '????????-??-??-??_[0-9][0-9][0-9]???.dng'`

## Alter permissions on some files that are not already set correctly

`find . -mindepth 2 -type f ! -perm 444 -exec chmod 444 {} \+`

## Find files in the current directory that do not match any of several listed filenames

`find . -maxdepth 1 -type f ! -iname '.*' ! -name .DS_Store ! -name '*.db'`

## Correctly handle spaces when piping to xargs

`find /Applications -mindepth 1 -maxdepth 1 -type d -name '* *' -print0 | xargs -0 -n1 echo`

## Find executable files

This finds all files where an executable bit is set.

With BSD find:

`find . -type f -perm +111`

With GNU find:

`find . -type f -executable`
