# Disable onboard frame buffer

I used this configuration to get linux to boot a Mac Mini with a bad graphics card that would not load a desktop environment.

In `/etc/default/grub`:

```
GRUB_CMDLINE_LINUX_DEFAULT="video=vesafb:off nofb vga=normal nomodeset"
```
