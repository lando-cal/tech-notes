[Handbrake](http://handbrake.m0k.org/) is a tool for ripping DVD's into MPEG or AVI files.

# CLI Examples

- <https://trac.handbrake.fr/wiki/CLIGuide>

## Deinterlacing for iPad

```
HandbrakeCLI -Z "AppleTV" --deinterlace fast --maxWidth 1024 -i infile -o outfile
```

## Show information about the source media for use with extended flags

```
HandBrakeCLI -t 0 -i VIDEO_TS
```

## Generate a 1000 frame preview of the AppleTV preset

`--stop-at` is relative to the start, so it describes the number of frames in the output.

```
HandBrakeCLI -i 2046/VIDEO_TS/ --start-at frame:5000 --stop-at frame:1000 -o foo.mp4 -Z AppleTV
```

## Fix 4:3 aspect ratio with the expanded syntax of the AppleTV preset

```
HandBrakeCLI \
-e x264 \
-q 20.0 \
-a 1,1 \
-E faac,ac3 \
-B 160,160 \
-6 dpl2,auto \
-R 48,Auto -D 0.0,0.0 \
-f mp4 \
-4 \
-X 960 \
--loose-anamorphic \
-m \
-x cabac=0:ref=2:me=umh:b-adapt=2:weightb=0:trellis=0:weightp=0 \
--custom-anamorphic \
--pixel-aspect 4:3
```
