"scriptable image processing system." - `sip --help`

# Examples

## Resize a DNG and save the output as JPG

```
sips --resampleHeightWidthMax 1024  --setProperty format jpeg foo.dng --out foo.jpg
```

## Resize all images in the CWD that were taken by the D5100

```
mdfind -onlyin "$PWD" 'kMDItemAcquisitionModel == "NIKON D5100"' |
while read -r line ; do
  sips --resampleHeightWidthMax 1600 --setProperty format jpeg "${line}" --out "${line%.*}.jpg"
done
```

## Resize all images in a dir tree, convert them to jpg and output them to a different folder

In the following example it is important to leave off the trailing slash on the target dir:

```
find . -type f -exec sips --resampleHeightWidthMax 800 --setProperty format jpeg {} --out /Volumes/B-Tron/all-jpgs \;
```
