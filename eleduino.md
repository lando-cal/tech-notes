# Eleduino SpotPear touchscreen
Taken from [https://github.com/notro/rpi-firmware/issues/6#issuecomment-63180647](https://github.com/notro/rpi-firmware/issues/6#issuecomment-63180647)

## update the firmware to support FBTFT

```
sudo apt-get install -y rpi-update
sudo REPO_URI=https://github.com/notro/rpi-firmware BRANCH=builtin rpi-update
sudo reboot
```

## Modify boot args to enable the device

```
sed -i "s/$/ \
fbtft_device.custom \
fbtft_device.name=fb_ili9340 \
fbtft_device.gpios=dc:22,reset:27 \
fbtft_device.bgr=1 \
fbtft_device.speed=48000000/" /boot/cmdline.txt
```

## Enable console on boot

```
sed -i "s/$/ \
fbcon=map:10 \
fbcon=font:ProFont6x11 \
logo.nologo/" /boot/cmdline.txt
```

## Rotation etc..

```
sed -i "s/$/ \
dma.dmachans=0x7f35 \
console=tty1 \
consoleblank=0 \
fbtft_device.fps=50 \
fbtft_device.rotate=270" /boot/cmdline.txt
```
