# Disable onboard frame buffer

I used this configuration to get text mode linux to boot on a Mac Mini with a bad graphics card that would not load a desktop environment. The machine was locking up at boot in OS X. Hardware test would boot with a striped color anomalies, but would never finish. Ubuntu Xenial would not boot correctly even to text mode without these settings.

In `/etc/default/grub`:

```
GRUB_CMDLINE_LINUX_DEFAULT="video=vesafb:off nofb vga=normal nomodeset"
```
