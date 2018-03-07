ffmpeg is a tool for editing movie files.

- <https://ffmpeg.org>

# Examples

## Convert container format

```
for X in *.mov ; do ffmpeg -i "${X}" -c copy -map 0 "${X%.mov}.mp4" ; done ;
```

## Time Lapse

### Generate a movie from an image sequence like 001.jpg-999.jpg

`ffmpeg -r 10 -b 1800 -i %03d.jpg test1800.mp4`

### Rename files as a sequence:

```
i=0 ;
find . -type f |
  while read -r F ; do
    let i=${i}+1 ;
    fn=$(printf %06d ${i}) ;
    mv "${F}" "${fn}.jpg" ;
  done ;
```

### Sample some of the middle of the time-lapse

`ffmpeg -pattern_type sequence -start_number 3000 -r 30 -i %06d.jpg -s 1440x1080 -frames 120 "$(date +%F_%T).mp4"`

### Turn these images into a video

`ffmpeg -pattern_type sequence -r 30 -i %06d.jpg -s 1440x1080 "$(date +%F_%T).mp4"`

## Audio Replace

Replace the audio of DSC_4436.AVI with 01 Gymnopedie 1.mp3 and limit the duration of the output so the music doesn't play beyond the end of the video.

`ffmpeg -t 00:00:47.99 -i DSC_4436.AVI -i "01 Gymnopedie 1.mp3" -map 0:0 -map 1:0 -vcodec copy -acodec copy output.AVI`

## Slow down video to half speed, drop audio

`ffmpeg -i DHO_8751.MOV -an -vf "setpts=(2/1)*PTS" output.mp4`

## Extract two seconds worth of frames at 24fps starting at 15m

`ffmpeg -i movie.mkv -r 24 -t 00:00:02.00 -ss 00:15:00 temp/movie-%4d.jpg`

## Detect errors in files

`ffmpeg -v error -i 20091024-08-46-00.mpg -f null - 2>> error.log`
