# ImageMagick

"ImageMagick is a free and open-source software suite for displaying, converting, and editing raster image and vector image files. It can read and write over 200 image file formats." - <https://en.wikipedia.org/wiki/ImageMagick>

ImageMagick is a framework for manipulating images. `convert` is the CLI front-end for it, and there are other modules/libraries for php, perl, etc..

# Limitations

* Does '''NOT''' handle DNG files. In [[OS X]] use [[sips]] to do this.

# Techniques

## Overlay the date on the image

```
for X in *.jpg ; do
  convert ${X} -font Times-Roman -pointsize 70 -fill black -annotate +100+100 %[exif:DateTimeOriginal] ${X}-date.jpg
done

for X in *date.jpg ; do
  convert ${X} -font Times-Roman -pointsize 70 -fill white -annotate +98+98 %[exif:DateTimeOriginal] ${X}-date2.jpg
done
```

## Delete all tags and metadata

```
convert -strip infile.jpg outfile.jpg
```

## Generate blurry, dark terminal backgrounds from normal backgrounds

```
for X in * ; do
  convert -resize 1100x1100 "${X}" -blur 0x4 -fill black -colorize 75% terminal."${X}"
done
```

## Generate shady versions of desktop pictures in OS X

```
for X in /Library/Desktop\ Pictures/*.jpg ; do
  IMG=$(basename "${X}")
  convert -resize 1100x1100 "${X}" -blur 0x4 -set option:modulate:colorspace hsb -modulate 20 ~/Pictures/terminal."${IMG}"
done
```

## Crop the center of images out

```
for X in /Volumes/data-b/Timelapse/20120407-14* ; do
  convert "${X}" -gravity Center -crop 1920x1080+0+0 $(basename ${X})
done
```

## Average many photos for a long-exposure style shot

```
convert *.jpg -average average.jpg
```

## Multiply several images

```
convert *.jpg -background white -compose multiply -flatten multiply.jpg
```

## Combine images always using the minimum value

```
convert *.jpg -background white -compose darken -flatten minimum.jpg
```

## Combine images always using the maximum value

```
convert *.jpg -background black -compose lighten -flatten maximum.jpg
```

## Swap red and blue channels (for [[IR]] photos)

```
convert infile.jpg -separate -swap 0,2 -combine swapped.jpg
```

## Animate some images

```
convert -delay 20 -loop 0 *.jpg animation.gif
```
