CLI Tool to read and write image metadata for many kinds of images.

- <http://www.sno.phy.queensu.ca/~phil/exiftool/>

# Tricks

## Strip all tags

```
exiftool -all= filename.jpg
```

## Show tags in a format that you can use to rewrite them

```
exiftool -S filename.jpg
```

## Expanded basic usage

```
exiftool -a -u -G:1:2 filename
```

## Add missing lens data on Rokinon 85mm

```
exiftool \
  -overwrite_original \
  -LensModel='Rokinon 85mm f/1.4' \
  -FocalLength='85' \
  -LongFocal='85' \
  -ShortFocal='85' \
  filename.dng
```

## Average photos

```
exiftool *.jpg -average outfile.jpg
```

## Correct EXIF time, for instance to sync with GPS time

```
# exiftool -AllDates-='Y:M:D H:M:S'
exiftool -AllDates+='0:0:0 0:1:56'
```

## Set all dates to something obviously wrong (useful for scanned images)

```
exiftool -alldates='1900:01:01 01:01:01' *
```

## Rename GPX files based on the capture time

```
exiftool "-FileName<GpxTrkTrksegTrkptTime" *.gpx ; prename 's/$/.gpx/' *Z
```

## Rename files to their original date and time using a lower case file extension

```
exiftool "-FileName<CreateDate" -d "%Y%m%d-%H-%M-%S%%-c.%%le" *.jpg
```

## Set file modify time to image capture time

```
exiftool "-FileModifyDate<DateTimeOriginal" *.jpg
```

## Generate a table of Filename, Camera Model and File Size in bytes, sorted by bytes

```
find /src_dir/ -iname '*.dng' |
  xargs  exiftool -p '$filename,$Model,$FileSize#' 2>/dev/null |
  sort   -t, -k3 -n |
  column -s, -t
```

## Generate rsync commands for files matching a string

```
exiftool -d "%s" -p 'rsync -aP $filename ~/Desktop/Stuff/ # $VideoFrameRate' 201411{2,3}* | grep -v '# 29\.'
```

## Rename files to their ShutterCount

Filenames will not be changed if ShutterCount field is not populated.

```
exiftool -P '-filename<${ShutterCount;}.%e' *.dng
```

## Rename files based on a set of possible names

Exiftool will use the last parameter where all variables are present.

```
exiftool -P -d '%F-%H-%M-%S' \
  '-filename<${DateTimeOriginal} - ${Make;}.%e' \
  '-filename<${CreateDate} - ${Make;}.%e' \
  '-filename<${DateTimeOriginal} - ${Make;} - ${Model;}.%e' \
  '-filename<${CreateDate} - ${Make;} - ${Model;}.%e' \
  '-filename<${DateTimeOriginal} - ${Make;} - ${Model;} - ${ShutterCount}.%e' \
  '-filename<${CreateDate} - ${Make;} - ${Model;} - ${ShutterCount}.%e' \
  *.dng
```

## Use TestName tag target to test what files would be renamed to

This block builds an array of possible tags to use as a filename, creates an exiftool argument string from that array, then tests what files would be named to. This is useful when dealing with files from various sources that don't all use the same tag to store the original media creation time. By using `TestName` instead of `FileName` as the target, we observe what would occur, essentially a dry-run, instead of actually renaming the files.

There is a funky behavior of %-c when you operate on a file that should ideally not be renamed. Exiftool will toggle back and forth each run appending and removing `-1`.

This assumes GNU xargs for the `-r` flag.

```
#!/usr/bin/env bash
set -x

# The last valid variable from this list is used as the filename source
create_date_sources=(
  TrackCreateDate
  RIFF:DateTimeOriginal
  MediaCreateDate
  FileModifyDate
  DateTimeOriginal
  CreateDate
)

for opt in "${create_date_sources[@]}" ; do
  args+=( "-TestName<${opt}" ) ;
done ;

args+=( '-d' './%Y/%m/%Y%m%d-%H-%M-%S%%-c.%%le' )

find . -maxdepth 1 -type f ! -name '*.sh' -print0 | xargs -0 -r exiftool "${args[@]}"
```

## Rename music files in a directory

There is a big gotcha here, which is that slashes will create directories where they appear, which can cause serious problems. The `${Tag;s/\//_/}` syntax replaces `/` with `_`, but there may be other characters that can cause unexpected results. This is a great place to use `-TestName` to inspect what would change before using `-FileName` to make the changes.

```
exiftool \
  '-FileName<${Artist;s/\//_/} - ${Title;s/\//_/}.%e' \
  '-FileName<${Artist;s/\//_/} - ${Album;s/\//_/} - ${Title;s/\//_/}.%e' \
  *.mp3 *.m4a
```

## Move short videos to one dir, long videos to another dir

In iOS, if you have Live Photo enabled it creates little movies each time you take a photo. While these can be very interesting context around photos, they can be quite irritating if you're playing through a collection of videos where these are mixed with videos of more moderate duration. The following code snip separates videos with a duration of more than 10 seconds from those with equal or lesser duration.

```
# -TestName is used here so it does not destroy data. Replace this with FileName to make this actually work.
# $Duration# has the # sign appended to make this tag machine readable so it can accurately be compared.
# We must use perl's numeric comparisons (>, <=), not string comparisons (gt, le)
# exiftool does not support if else syntax, so for the else condition you must run a second command.

long_args=(  "-TestName<${opt}" '-d' "${working_path}/long/%Y/%m/%Y%m%d-%H-%M-%S%%-c.%%le"  '-if' '${Duration#} >  10' )
short_args=( "-TestName<${opt}" '-d' "${working_path}/short/%Y/%m/%Y%m%d-%H-%M-%S%%-c.%%le" '-if' '${Duration#} <= 10' )

find "${PWD}" -maxdepth 1 -type f -print0 | xargs -0 -r exiftool "${long_args[@]}"
find "${PWD}" -maxdepth 1 -type f -print0 | xargs -0 -r exiftool "${short_args[@]}"
```
