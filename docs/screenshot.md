Title: Screenshots

Different methods for grabbing an graphical image of what is being displayed on a physical or virtual device.

# Linux

## Grab all vt screenshots

```
for X in {0..10} ; do
  sudo DISPLAY=:0 fbgrab -c${X} fbgrab_vt${X}_screenshot.png ;
done ;
```

## Screenshot X using scrot

```
sudo DISPLAY=:0 scrot -b -d 5 'scrot_%F-%T.png'
```

## Screenshot X using imagemagick

```
sudo DISPLAY=:0 import -window root imagemagick_screenshot.png
```

# macOS

```
screencapture screenshot.png
```

There are a lot of command line args for this tool.
