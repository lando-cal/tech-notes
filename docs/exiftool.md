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
exiftool -a -u -G1 filename
```

## Fix incorrect lens data on Rokinon 85mm

```
exiftool -overwrite_original -LensModel='Rokinon 85mm f/1.4' -FocalLength='85' -LongFocal='85' -ShortFocal='85' filename.dng
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
  xargs  -n8 -P2 exiftool -p '$filename,$Model,$FileSize#' 2>/dev/null |
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
